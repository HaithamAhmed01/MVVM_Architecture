import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/core/utils/helper.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';
import 'LoginFormWidget.dart';
import 'LoginWelcomeWidget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.backgroundColor,
        systemNavigationBarDividerColor: AppColors.backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Stack(
        children: [
          Container(
            color: AppColors.subLightColor,
            width: context.width,
            child: Image.asset(
              Assets.imagesCoverImage,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p100),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: AppPadding.p80),
                  padding: const EdgeInsets.only(
                    right: AppPadding.p16,
                    left: AppPadding.p16,
                    top: AppPadding.p16,
                  ),
                  decoration: const ShapeDecoration(
                    color: AppColors.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppPadding.p40),
                      ),
                    ),
                  ),
                  height: context.height,
                  width: context.width,
                  child: const SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoginWelcomeWidget(),
                        LoginFormWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
