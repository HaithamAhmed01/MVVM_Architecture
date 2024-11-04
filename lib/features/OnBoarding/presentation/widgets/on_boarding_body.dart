import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/routes/app_rout.dart';
import 'package:test/core/utils/app_colors.dart';
import 'package:test/core/utils/app_values.dart';
import 'package:test/core/utils/helper.dart';

import '../../../../../core/utils/app_prefs.dart';
import '../../../../../core/utils/injection_container.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../data/model/on_boarding_model.dart';
import 'dot_widget.dart';
import 'page_view_item.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  int currentIndex = 0;
  late PageController _controller;
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  void initState() {
    _appPreferences.setOnBoardingScreenViewed();
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  /// Anime
  Widget animationDo({
    required int index,
    required int delay,
    required Widget child,
  }) {
    if (index == 1 || index == 3) {
      return SlideInUp(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    } else {
      return FadeInUp(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Row(
              children: [
                currentIndex != 0
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = currentIndex - 1;
                            _controller.animateToPage(
                              currentIndex,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastOutSlowIn,
                            );
                          });
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_back_ios_sharp,
                            ),
                            Text(
                              "السابق",
                              style: context
                                  .bodyLarge()
                                  .copyWith(color: AppColors.blackColor),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const Spacer(),
                currentIndex != onBoarding.length - 1
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.animateToPage(
                              3,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastOutSlowIn,
                            );
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              "تخطي",
                              style: context
                                  .bodyLarge()
                                  .copyWith(color: AppColors.blackColor),
                            ),
                            const Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: PageView.builder(
              controller: _controller,
              itemCount: onBoarding.length,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return PageViewItem(
                  onBoarding: onBoarding,
                  index: index,
                );
              },
            ),
          ),
          DotWidget(
            currentIndex: currentIndex,
            listIndex: onBoarding.length,
          ),
          AppSize.s32.height,
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppPadding.p16),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x1400727A),
                      blurRadius: 16,
                      offset: Offset(0, -9),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      animationDo(
                        index: currentIndex,
                        delay: 100,
                        child: Text(
                          onBoarding[currentIndex].title,
                          style: context.titleLarge().copyWith(
                                fontSize: 20.sp,
                                color: AppColors.primaryColor,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      AppSize.s16.height,
                      animationDo(
                        index: currentIndex,
                        delay: 200,
                        child: Text(
                          onBoarding[currentIndex].text,
                          style: context.bodyLarge().copyWith(
                                // color: AppColors.subLightColor,
                                fontWeight: AppFontWeight.medium,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                      currentIndex != onBoarding.length - 1
                          ? CustomButton(
                              text: 'التالي',
                              iconLeft: true,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.whiteColor,
                              ),
                              onTap: () {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastOutSlowIn,
                                );
                              },
                            )
                          : CustomButton(
                              text: 'ابدأ الآن',
                              iconLeft: true,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.whiteColor,
                              ),
                              onTap: () {
                                context.go(
                                  AppRouts.loginScreen,
                                );
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AppSize.s16.height,
        ],
      ),
    );
  }
}
