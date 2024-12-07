import 'package:flutter/material.dart';
import 'package:test/core/utils/helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/app_values.dart';

class LoginWelcomeWidget extends StatelessWidget {
  const LoginWelcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSize.s24.height,
        Text(context.textTr(AppStrings.welcomeBack),
            style: context.titleLarge()),
        Text(
          context.textTr(AppStrings.typeInformationLogin),
          style: context.bodyLarge().copyWith(
                color: AppColors.blackColor,
              ),
        ),
        AppSize.s35.height,
      ],
    );
  }
}
