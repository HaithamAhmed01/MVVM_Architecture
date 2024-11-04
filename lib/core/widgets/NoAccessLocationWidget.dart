import 'package:test/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/routes/app_rout.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_outline_buttom.dart';

class NoAccessLocationWidget extends StatelessWidget {
  const NoAccessLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        children: [
          SvgPicture.asset(
            Assets.iconsNoLocation,
          ),
          AppSize.s16.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Text(
              context.textTr(AppStrings.cannotDetectLocation),
              style: context.titleMedium(),
              textAlign: TextAlign.center,
            ),
          ),
          AppSize.s16.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Text(
              context.textTr(AppStrings.cannotDetectLocationDes),
              style: context.bodyLarge(),
              textAlign: TextAlign.center,
            ),
          ),
          AppSize.s16.height,
          CustomButton(
            width: context.width,
            text: context.textTr(AppStrings.enableLocation),
            color: AppColors.secondaryColor,
            onTap: () {
              Geolocator.openAppSettings();
            },
          ),
          AppSize.s8.height,
          CustomOutlineButton(
            width: context.width,
            color: AppColors.secondaryColor,
            text: context.textTr(AppStrings.setLocationManually),
            onTap: () {
              context.push(AppRouts.locationViewScreen);
            },
          ),
        ],
      ),
    );
  }
}
