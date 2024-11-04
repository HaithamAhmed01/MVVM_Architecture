import 'package:test/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/app_values.dart';
import 'custom_loading_indicator.dart';

Future<dynamic> buildLoadingDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppPadding.p24),
        ),
        padding: const EdgeInsets.all(AppPadding.p30),
        child: const CustomLoadingIndicator(),
      ),
    ),
  );
}
