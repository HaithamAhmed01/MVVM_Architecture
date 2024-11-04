import 'package:flutter/material.dart';
import 'package:test/core/utils/helper.dart';

import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/shimmer_helper.dart';
import '../../../../core/widgets/buildBoxDecoration.dart';

class NotificationLoadingWidget extends StatelessWidget {
  const NotificationLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(
          top: AppPadding.p32,
          left: AppPadding.p16,
          right: AppPadding.p16,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
          decoration: buildLightShapeDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                      width: context.width * .6,
                      child: ShimmerHelper().buildBasicShimmer(),
                    ),
                    const Spacer(),
                    Container(
                      width: 24,
                      height: 24,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(120),
                        ),
                      ),
                      child: ShimmerHelper().buildBasicShimmer(),
                    ),
                  ],
                ),
                AppSize.s8.height,
                SizedBox(
                  height: 15,
                  width: context.width * .8,
                  child: ShimmerHelper().buildBasicShimmer(),
                ),
                AppSize.s8.height,
                SizedBox(
                  height: 15,
                  width: context.width * .6,
                  child: ShimmerHelper().buildBasicShimmer(),
                ),
                AppSize.s8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 15,
                      width: 100,
                      child: ShimmerHelper().buildBasicShimmer(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
