import 'package:flutter/material.dart';
import 'package:test/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

import 'app_values.dart';

class ShimmerHelper {
  buildBasicShimmer({
    double height = double.infinity,
    double width = double.infinity,
    Color color = AppColors.grey,
    double borderRadius = AppPadding.p16,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Shimmer.fromColors(
        baseColor: color,
        highlightColor: AppColors.whiteColor,
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
        ),
      ),
    );
  }

  buildBasicShimmer2({
    double height = double.infinity,
    double width = double.infinity,
    double borderRadius = AppPadding.p16,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Shimmer.fromColors(
        baseColor: AppColors.grey2,
        highlightColor: AppColors.grey,
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
        ),
      ),
    );
  }

  buildCardShimmer({
    double height = double.infinity,
    double width = double.infinity,
    double borderRadius = AppPadding.p16,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Shimmer.fromColors(
        baseColor: AppColors.primaryColor.withOpacity(0.1),
        highlightColor: AppColors.primaryColor.withOpacity(0.3),
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
        ),
      ),
    );
  }

  buildListShimmer({
    itemCount = 10,
    itemHeight = 100.0,
  }) {
    return ListView.builder(
      itemCount: itemCount,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 0.0,
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
          ),
          child: ShimmerHelper().buildBasicShimmer(height: itemHeight),
        );
      },
    );
  }

  buildProductGridShimmer({
    sController,
    itemCount = 10,
  }) {
    return ListView.builder(
      // 2
      //addAutomaticKeepAlives: true,
      itemCount: itemCount,
      controller: sController,
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.horizontal,
      itemExtent: 220,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade50,
            highlightColor: Colors.grey.shade200,
            child: Container(
              height: 120,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  buildSquareGridShimmer({
    sController,
    itemCount = 10,
  }) {
    return GridView.builder(
      itemCount: itemCount,
      controller: sController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade50,
            highlightColor: Colors.grey.shade200,
            child: Container(
              height: 120,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
