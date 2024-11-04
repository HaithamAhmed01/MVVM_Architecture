import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test/core/utils/app_colors.dart';

import '../utils/app_values.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.color,
  });

  final String imageUrl;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      color: color,
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppPadding.p8),
          color: Colors.grey.withOpacity(.3),
        ),
      ),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(AppPadding.p8),
          image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.cover,
              colorFilter: ColorFilter.mode(
                color ?? Colors.transparent,
                BlendMode.color,
              )),
        ),
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        color: color ?? AppColors.primaryColor,
      ),
    );
  }
}
