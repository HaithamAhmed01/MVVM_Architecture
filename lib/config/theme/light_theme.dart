import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_fonts.dart';
import '../../core/utils/app_values.dart';
import 'color_schemes.g.dart';

ThemeData light = ThemeData(
  colorScheme: MaterialTheme.lightScheme(),
  primaryColor: AppColors.primaryColor,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
    ),
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: AppColors.primaryColor,
    // surfaceTintColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: AppColors.primaryColor,
      systemNavigationBarColor: AppColors.backgroundColor,
      systemNavigationBarDividerColor: AppColors.backgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      fontFamily: AppFontConstants.fontFamily,
      color: AppColors.titleLightColor,
      fontSize: AppFontSize.s18.sp,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.titleLightColor,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: AppFontSize.s17.sp,
      fontWeight: AppFontWeight.bold,
      color: AppColors.titleLightColor,
    ),
    titleMedium: TextStyle(
      fontSize: AppFontSize.s15.sp,
      fontWeight: AppFontWeight.bold,
      color: AppColors.titleLightColor,
    ),
    displayMedium: TextStyle(
      fontSize: AppFontSize.s15.sp,
      fontWeight: AppFontWeight.bold,
      color: AppColors.whiteColor,
    ),
    bodyLarge: TextStyle(
      fontSize: AppFontSize.s13.sp,
      fontWeight: AppFontWeight.regular,
      color: AppColors.subLightColor,
    ),
    bodyMedium: TextStyle(
      fontSize: AppFontSize.s11.sp,
      fontWeight: AppFontWeight.regular,
      color: AppColors.subLightColor,
    ),
    labelMedium: TextStyle(
      fontSize: AppFontSize.s11.sp,
      fontWeight: AppFontWeight.regular,
      color: AppColors.subLightColor,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all<Color>(AppColors.whiteColor),
    trackColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      }
      return AppColors.labelColor;
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        }
        return AppColors.labelColor;
      },
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        }
        return AppColors.labelColor2;
      },
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    side: WidgetStateBorderSide.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const BorderSide(
          color: Colors.transparent,
        );
      }
      return const BorderSide(
        color: Colors.transparent,
      );
    }),
    checkColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return Colors.white;
    }),
    materialTapTargetSize: MaterialTapTargetSize.padded,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 20.0,
    backgroundColor: AppColors.backgroundColor,
    type: BottomNavigationBarType.fixed,
    enableFeedback: false,
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: AppColors.labelColor,
  ),
  inputDecorationTheme: buildInputDecoration(),
  fontFamily: AppFontConstants.fontFamily,
);

InputDecorationTheme buildInputDecoration() {
  return InputDecorationTheme(
    errorStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: AppFontSize.s10.sp,
      letterSpacing: 1,
      fontFamily: AppFontConstants.fontFamily,
    ),
    hintStyle: const TextStyle(
      fontWeight: AppFontWeight.regular,
      color: AppColors.labelColor,
      fontFamily: AppFontConstants.fontFamily,
    ),
    hoverColor: AppColors.backgroundColor,
    focusColor: AppColors.backgroundColor,
    fillColor: AppColors.backgroundColor,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
    border: buildOutlineInputBorder(),
    enabledBorder: buildOutlineInputBorder(),
    errorBorder: buildOutlineInputBorder(Colors.red),
    focusedErrorBorder: buildOutlineInputBorder(Colors.red),
    focusedBorder: buildOutlineInputBorder(),
  );
}

OutlineInputBorder buildOutlineInputBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppPadding.p8),
    borderSide: BorderSide(
      color: color ?? AppColors.lightGrey,
    ),
  );
}
