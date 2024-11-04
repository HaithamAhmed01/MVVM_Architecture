import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_fonts.dart';
import 'color_schemes.g.dart';

ThemeData dark = ThemeData(
  colorScheme: MaterialTheme.darkScheme(),
  primaryColor: AppColors.primaryColor,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.backgroundDarkColor,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: AppColors.backgroundDarkColor,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundDarkColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.backgroundDarkColor,
      systemNavigationBarDividerColor: AppColors.backgroundDarkColor,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      fontFamily: AppFontConstants.fontFamily,
      color: AppColors.whiteColor,
      fontSize: AppFontSize.s18.sp,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.whiteColor,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: AppFontSize.s16.sp,
      fontWeight: AppFontWeight.bold,
      color: AppColors.whiteColor,
    ),
    titleMedium: TextStyle(
      fontSize: AppFontSize.s14.sp,
      fontWeight: AppFontWeight.bold,
      color: AppColors.whiteColor,
    ),
    displayMedium: TextStyle(
      fontSize: AppFontSize.s16.sp,
      fontWeight: AppFontWeight.bold,
      color: AppColors.whiteColor,
    ),
    bodyLarge: TextStyle(
      fontSize: AppFontSize.s14.sp,
      fontWeight: AppFontWeight.semiBold,
      color: AppColors.subDarkColor,
    ),
    bodyMedium: TextStyle(
      fontSize: AppFontSize.s12.sp,
      fontWeight: AppFontWeight.semiBold,
      color: AppColors.subDarkColor,
    ),
    labelMedium: TextStyle(
      fontSize: AppFontSize.s10.sp,
      fontWeight: AppFontWeight.semiBold,
      color: AppColors.subDarkColor,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),
    trackColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Color(0xFF617C98);
      }
      return const Color(0xFF787880);
    }),
    trackOutlineColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Color(0xFF617C98);
      }
      return const Color(0xFF787880);
    }),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 20.0,
    backgroundColor: AppColors.secondaryDarkColor,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.secondaryColor,
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
      fontWeight: FontWeight.bold,
      color: Colors.grey,
      fontFamily: AppFontConstants.fontFamily,
    ),
    hoverColor: AppColors.backgroundDarkColor,
    focusColor: AppColors.backgroundDarkColor,
    fillColor: AppColors.backgroundDarkColor,
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
    borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(17),
        topLeft: Radius.circular(17),
        bottomRight: Radius.circular(17)),
    borderSide: BorderSide(
      color: color ?? AppColors.backgroundDarkColor,
    ),
  );
}
