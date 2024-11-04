import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test/core/utils/app_colors.dart';

import '../utils/app_values.dart';

class ContainerIconWidget extends StatelessWidget {
  const ContainerIconWidget({
    super.key,
    this.icon,
    this.height,
    this.width,
    this.color,
    this.colorIcon,
    this.iconWidget,
  });

  final String? icon;
  final Widget? iconWidget;
  final double? height;
  final double? width;
  final Color? color;
  final Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: color ?? AppColors.labelColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppPadding.p8)),
      ),
      child: iconWidget ??
          SvgPicture.asset(
            icon!,
            color: colorIcon,
          ),
    );
  }
}
