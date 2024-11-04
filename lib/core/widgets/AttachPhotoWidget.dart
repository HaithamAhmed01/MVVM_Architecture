import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_fonts.dart';
import 'package:test/core/utils/helper.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/widgets/buildBoxDecoration.dart';

class AttachPhotoWidget extends StatelessWidget {
  const AttachPhotoWidget({
    super.key,
    required this.onTapCamera,
    required this.onTapGallery,
  });

  final GestureTapCallback onTapCamera;

  final GestureTapCallback onTapGallery;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSize.s8.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.textTr(AppStrings.addPhoto),
              style: context.titleMedium(),
            ),
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(
                Assets.iconsCloseCircle,
                color: AppColors.labelColor,
              ),
            ),
          ],
        ),
        AppSize.s16.height,
        Container(
          decoration: buildLightShapeDecoration(),
          child: ListTile(
            leading: SvgPicture.asset(
              Assets.iconsCameraIcon,
            ),
            title: Text(
              context.textTr(AppStrings.camera),
              style: context.titleMedium().copyWith(
                    fontWeight: AppFontWeight.semiBold,
                  ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.labelColor,
            ),
            onTap: onTapCamera,
          ),
        ),
        AppSize.s16.height,
        Container(
          decoration: buildLightShapeDecoration(),
          child: ListTile(
            leading: SvgPicture.asset(
              Assets.iconsGalleryIcon,
            ),
            title: Text(
              context.textTr(AppStrings.gallery),
              style: context.titleMedium().copyWith(
                    fontWeight: AppFontWeight.semiBold,
                  ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.labelColor,
            ),
            onTap: onTapGallery,
          ),
        ),
        AppSize.s60.height,
      ],
    );
  }
}
