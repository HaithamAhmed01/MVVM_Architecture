import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/helper.dart';

import '../../../config/routes/app_rout.dart';
import '../utils/app_assets.dart';
import '../utils/app_fonts.dart';
import '../utils/app_string.dart';
import '../utils/app_values.dart';
import 'custom_button.dart';

class GuestWidget extends StatelessWidget {
  const GuestWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.iconsLogoutIcon,
          ),
          AppSize.s16.height,
          Text(
            context.textTr(AppStrings.guestTitle),
            style: context.titleMedium(),
            textAlign: TextAlign.center,
          ),
          AppSize.s16.height,
          Text(
            context.textTr(AppStrings.guestDes),
            style: context.bodyMedium().copyWith(
                  fontWeight: AppFontWeight.semiBold,
                ),
            textAlign: TextAlign.center,
          ),
          AppSize.s32.height,
          CustomButton(
            text: context.textTr(AppStrings.login),
            onTap: () {
              context.push(AppRouts.loginScreen);
            },
          ),
        ],
      ),
    );
  }
}
