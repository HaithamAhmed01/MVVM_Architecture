import 'package:flutter/material.dart';
import 'package:test/core/utils/helper.dart';

import '../app_assets.dart';
import '../app_colors.dart';
import 'custom_snack_bar.dart';

void warningSnackBar(BuildContext context, message) {
  if (context.textTrCheck(message) != null) {
    customSnackBar(
      body: context.textTr(message),
      icon: Assets.iconsDangerTriangle,
      sideColor: AppColors.warningColor,
      backgroundColor: AppColors.warningSecondaryColor,
      context,
    );
  } else {
    customSnackBar(
      body: message,
      icon: Assets.iconsDangerTriangle,
      sideColor: AppColors.warningColor,
      backgroundColor: AppColors.warningSecondaryColor,
      context,
    );
  }
}
