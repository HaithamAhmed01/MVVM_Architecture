import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/core/utils/helper.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/function/launch_url.dart';
import '../../../../core/widgets/custom_button.dart';

class ForceUpdateScreen extends StatelessWidget {
  const ForceUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: AppColors.backgroundColor,
          systemNavigationBarDividerColor: AppColors.backgroundColor,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: Stack(
          children: [
            Image.asset(
              Assets.imagesNEWUPDATE,
              fit: BoxFit.cover,
              height: context.height,
              width: context.width,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p16,
                  right: AppPadding.p16,
                  bottom: AppPadding.p32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.textTr(AppStrings.newUpdate),
                      style: context.titleMedium().copyWith(
                            color: AppColors.whiteColor,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    AppSize.s8.height,
                    Text(
                      context.textTr(AppStrings.newUpdateDes),
                      style: context.bodyLarge().copyWith(
                            color: AppColors.whiteColor,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    AppSize.s50.height,
                    CustomButton(
                      text: context.textTr(AppStrings.updateNow),
                      color: AppColors.whiteColor,
                      colorText: AppColors.darkColor,
                      onTap: () {
                        if (Platform.operatingSystem == 'android') {
                          launchCustomUrl(
                              context, AppStrings.appLinkGooglePlay);
                        } else if (Platform.operatingSystem == 'ios') {
                          launchCustomUrl(context, AppStrings.appLinkAppStore);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
