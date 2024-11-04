import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class DashedBorderPainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final double borderRadius;

  DashedBorderPainter({
    this.dashWidth = 10.0,
    this.dashSpace = 5.0,
    this.borderRadius = 15.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.primaryColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    // Draw dashed border around the rounded rectangle
    Path path = Path()..addRRect(rrect);
    Path dashPath = Path();

    double totalLength = path.computeMetrics().first.length;
    double distance = 0;

    while (distance < totalLength) {
      for (PathMetric pathMetric in path.computeMetrics()) {
        final extractPath = pathMetric.extractPath(
          distance,
          distance + dashWidth,
        );
        dashPath.addPath(extractPath, Offset.zero);
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
