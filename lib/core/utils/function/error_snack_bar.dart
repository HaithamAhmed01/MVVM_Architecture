import 'package:flutter/material.dart';
import 'package:test/core/utils/helper.dart';

import '../app_assets.dart';
import '../app_colors.dart';
import 'custom_snack_bar.dart';

void errorSnackBar(BuildContext context, message) {
  if (context.textTrCheck(message) != null) {
    customSnackBar(
      body: context.textTr(message),
      icon: Assets.iconsCloseCircle2,
      sideColor: AppColors.errorColor,
      backgroundColor: AppColors.errorSecondaryColor,
      context,
    );
  } else {
    customSnackBar(
      body: message,
      icon: Assets.iconsCloseCircle2,
      sideColor: AppColors.errorColor,
      backgroundColor: AppColors.errorSecondaryColor,
      context,
    );
  }
}
