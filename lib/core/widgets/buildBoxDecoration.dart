import 'package:flutter/material.dart';
import 'package:test/core/utils/app_colors.dart';

import '../utils/app_values.dart';

BoxDecoration buildBoxDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.00, -1.00),
      end: Alignment(0, 1),
      colors: [
        AppColors.primaryColor,
        AppColors.secondaryColor,
        AppColors.secondaryColor,
        AppColors.secondaryColor,
      ],
    ),
  );
}

ShapeDecoration buildLightShapeDecoration() {
  return ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    shadows: const [
      BoxShadow(
        color: Color(0x1400727A),
        blurRadius: 16,
        offset: Offset(0, 4),
        spreadRadius: 0,
      )
    ],
  );
}

ShapeDecoration buildLightShapeDecoration2() {
  return ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    shadows: [
      BoxShadow(
        color: Color(0x1400727A),
        blurRadius: 16,
        offset: Offset(0, 4),
        spreadRadius: 0,
      )
    ],
  );
}

ShapeDecoration buildLightShapeDecoration3() {
  return ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppPadding.p16),
    ),
    shadows: const [
      BoxShadow(
        color: Color(0x0F000000),
        blurRadius: 16,
        offset: Offset(0, 5),
        spreadRadius: 0,
      )
    ],
  );
}

ShapeDecoration buildDarkShapeDecoration() {
  return ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppPadding.p8)),
    shadows: const [
      BoxShadow(
        color: Color(0x19000000),
        blurRadius: 16,
        offset: Offset(0, 8),
        spreadRadius: 0,
      )
    ],
  );
}

InputDecoration otpInputDecoration() {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 10),
    filled: true,
    fillColor: AppColors.backgroundColor,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    floatingLabelStyle: const TextStyle(color: AppColors.buttonColor),
    border: outlineInputBorder(),
    focusedBorder: outlineInputBorder(AppColors.primaryColor),
    enabledBorder: outlineInputBorder(),
  );
}

OutlineInputBorder outlineInputBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppPadding.p8),
    borderSide: BorderSide(color: color ?? AppColors.labelColor),
  );
}
