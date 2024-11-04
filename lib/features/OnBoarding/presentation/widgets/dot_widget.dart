import 'package:flutter/material.dart';
import 'package:test/core/utils/app_colors.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    super.key,
    required this.currentIndex,
    required this.listIndex,
  });

  final int currentIndex;
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        listIndex,
        (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 20,
            width: 20,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.primaryColor,
                width: 1,
              ),
              color: currentIndex == index
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
            ),
          );
        },
      ),
    );
  }
}
