import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/helper.dart';
import '../../../config/routes/app_rout.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_outline_buttom.dart';
import '../../widgets/dialog.dart';
import '../app_assets.dart';
import '../app_colors.dart';
import '../app_string.dart';
import '../app_values.dart';

void guestDialog(BuildContext context) {
  showCustomDialog(
    context: context,
    image: Assets.iconsLogoutIcon,
    title: context.textTr(AppStrings.guestTitle),
    description: context.textTr(AppStrings.guestDes),
    buttonTitle: context.textTr(AppStrings.login),
    onButtonPressed: () {
      context.push(AppRouts.loginScreen);
      Navigator.of(context).pop(false);
    },
  );
}
