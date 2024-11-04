import 'package:flutter/material.dart';
import 'package:test/core/utils/helper.dart';

import '../utils/app_colors.dart';
import '../utils/app_values.dart';

Future<dynamic> bottomSheet({
  required BuildContext context,
  required Widget widget,
  double? height,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppPadding.p16),
            topRight: Radius.circular(AppPadding.p16),
          ),
          color: AppColors.backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 88,
                    height: 6,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE4E7E7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
                AppSize.s16.height,
                widget,
              ],
            ),
          ),
        ),
      );
    },
  );
}
