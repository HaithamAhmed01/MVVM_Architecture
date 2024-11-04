import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/core/utils/app_colors.dart';
import 'package:test/core/utils/app_values.dart';
import 'package:test/core/utils/helper.dart';

void customSnackBar(
  BuildContext context, {
  String body = '',
  String? icon,
  required Color backgroundColor,
  required Color sideColor,
  Color? textColor,
  Duration? duration,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      duration: duration ?? 2.seconds,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p12,
          horizontal: AppPadding.p6,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: BorderDirectional(
            start: BorderSide(
              color: sideColor,
              width: 8,
            ),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon ?? '',
              color: sideColor,
            ),
            AppSize.s8.width,
            Expanded(
              child: Text(
                body,
                style: context.bodyMedium().copyWith(
                      color: AppColors.blackColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
