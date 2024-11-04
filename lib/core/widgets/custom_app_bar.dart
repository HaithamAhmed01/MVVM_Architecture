import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_colors.dart';
import 'package:test/core/utils/helper.dart';
import '../utils/app_values.dart';

AppBar customAppBar({
  required String title,
  required BuildContext context,
  Widget? actions,
  Function()? backFunction,
  bool back = true,
  bool? centerTitle,
}) {
  return AppBar(
    flexibleSpace: Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      decoration: const ShapeDecoration(
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppPadding.p24),
            bottomRight: Radius.circular(AppPadding.p24),
          ),
        ),
      ),
    ),
    title: Text(
      title,
      style: context.titleLarge().copyWith(color: Colors.white),
    ),
    titleSpacing: 0,
    centerTitle: centerTitle ?? false,
    actions: [actions ?? const SizedBox()],
    leading: back
        ? GestureDetector(
            onTap: backFunction ??
                () {
                  context.pop();
                },
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.whiteColor,
            ),
          )
        : const SizedBox(),
    backgroundColor: Colors.transparent,
    toolbarHeight: 75,
  );
}
