import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/core/utils/app_colors.dart';

import '../widgets/on_boarding_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.backgroundColor,
        systemNavigationBarDividerColor: AppColors.backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: OnBoardingBody(),
    );
  }
}
