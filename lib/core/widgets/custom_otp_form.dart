import 'package:flutter/material.dart';
import 'package:test/core/utils/app_colors.dart';
import 'package:test/core/utils/app_fonts.dart';
import 'package:test/core/utils/helper.dart';
import 'package:pinput/pinput.dart';
import '../utils/app_values.dart';

class CustomOTBForm extends StatefulWidget {
  const CustomOTBForm({
    super.key,
    required this.pinController,
    required this.onCompleted,
  });

  final TextEditingController pinController;

  final Function(String)? onCompleted;

  @override
  State<CustomOTBForm> createState() => _CustomOTBFormState();
}

class _CustomOTBFormState extends State<CustomOTBForm> {
  final formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: context.titleLarge().copyWith(
            fontWeight: AppFontWeight.regular,
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppPadding.p8),
        border: Border.all(color: AppColors.pinColor),
        color: AppColors.pinColor,
      ),
    );
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: widget.pinController,
        focusNode: focusNode,
        autofocus: true,
        defaultPinTheme: defaultPinTheme,
        separatorBuilder: (index) => AppSize.s16.width,
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onCompleted: widget.onCompleted,
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: AppColors.primaryColor),
            color: AppColors.whiteColor,
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: AppColors.pinColor),
            color: AppColors.pinColor,
          ),
        ),
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: Border.all(color: AppColors.errorColor),
        ),
      ),
    );
  }
}
