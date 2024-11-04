import 'package:flutter/material.dart';
import 'package:test/core/utils/app_colors.dart';
import 'package:test/core/utils/app_string.dart';
import 'package:test/core/utils/app_values.dart';
import 'package:test/core/utils/helper.dart';
import 'package:test/core/widgets/custom_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage, this.onPress});

  final String errMessage;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              Icons.warning_amber_rounded,
              color: AppColors.buttonColor,
              size: 150,
            ),
          ),
          Text(
            errMessage,
            style: context.bodyLarge(),
            textAlign: TextAlign.center,
          ),
          AppSize.s30.height,
          CustomButton(
            text: context.textTr(AppStrings.tryAgain),
            onTap: () {
              if (onPress != null) {
                onPress!();
              }
            },
          ),
        ],
      ),
    );
  }
}
