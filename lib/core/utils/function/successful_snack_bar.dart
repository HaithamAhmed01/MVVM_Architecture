import 'package:flutter/material.dart';
import 'package:test/core/utils/helper.dart';

import '../app_assets.dart';
import '../app_colors.dart';
import 'custom_snack_bar.dart';

void successfulSnackBar(BuildContext context, message, {int? duration}) {
  if (context.textTrCheck(message) != null) {
    customSnackBar(
      body: context.textTr(message),
      icon: Assets.iconsCheckCircle,
      sideColor: AppColors.successColor,
      backgroundColor: AppColors.successSecondaryColor,
      duration: duration.seconds,
      context,
    );
  } else {
    customSnackBar(
      body: message,
      icon: Assets.iconsCheckCircle,
      sideColor: AppColors.successColor,
      backgroundColor: AppColors.successSecondaryColor,
      duration: duration.seconds,
      context,
    );
  }
}
