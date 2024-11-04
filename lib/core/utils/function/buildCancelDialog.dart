import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_string.dart';
import 'package:test/core/utils/app_values.dart';
import 'package:test/core/utils/helper.dart';
import 'package:test/core/widgets/dialog.dart';

import '../../../config/routes/app_rout.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_outline_buttom.dart';
import '../app_assets.dart';
import '../app_colors.dart';

Future<dynamic> buildCancelDialog({
  required BuildContext context,
  required int numOfPop,
}) {
  return showCustomDialog(
    context: context,
    image: Assets.iconsCancelImage,
    title: context.textTr(AppStrings.paymentCancelled),
    buttonTitle: context.textTr(AppStrings.ok),
    closeButtonTitle: context.textTr(AppStrings.backToContinue),
    onButtonPressed: () {
      List.generate(
        numOfPop,
        (_) => context.pop(),
      );
    },
  );
}

Future<dynamic> buildCancelDialog2({
  required BuildContext context,
  required int numOfPop,
}) {
  return showCustomDialog(
    context: context,
    image: Assets.iconsOrderIcon,
    title: context.textTr(AppStrings.orderCancelled),
    buttonTitle: context.textTr(AppStrings.ok),
    closeButtonTitle: context.textTr(AppStrings.backToContinue),
    onButtonPressed: () {
      List.generate(
        numOfPop,
        (_) => context.pop(),
      );
    },
  );
}
