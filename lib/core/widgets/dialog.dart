import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test/core/utils/app_fonts.dart';
import 'package:test/core/utils/helper.dart';
import '../../features/splash/manager/theme_cubit/theme_cubit.dart';
import '../utils/app_colors.dart';
import '../utils/app_string.dart';
import '../utils/app_values.dart';
import 'custom_button.dart';

Future<dynamic> showCustomDialog({
  Widget? widget,
  required BuildContext context,
  required String image,
  Color? imageColor,
  required String title,
  String? description,
  required String buttonTitle,
  Color? buttonColor,
  required VoidCallback onButtonPressed,
  bool? dismissible,
  Widget? buttonWidget,
  Widget? bodyWidget,
  String? closeButtonTitle,
  bool showCloseButton = true,
}) {
  final themeCubit = BlocProvider.of<ThemeCubit>(context);
  return showDialog(
    context: context,
    barrierDismissible: dismissible ?? true,
    builder: (context) => Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
        ),
        decoration: ShapeDecoration(
          color: themeCubit.them
              ? AppColors.whiteColor
              : AppColors.secondaryDarkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: widget ??
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: ShapeDecoration(
                      color: imageColor ?? AppColors.secondaryColor2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppPadding.p16),
                      ),
                    ),
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: Center(
                      child: SvgPicture.asset(
                        image,
                      ),
                    ),
                  ),
                  AppSize.s16.height,
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                    child: Text(
                      title,
                      style: context.titleMedium(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  AppSize.s8.height,
                  description != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p16),
                          child: Text(
                            description ?? '',
                            style: context.bodyMedium().copyWith(
                                  fontWeight: AppFontWeight.semiBold,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : const SizedBox(),
                  bodyWidget ?? const SizedBox(),
                  AppSize.s16.height,
                  buttonWidget ??
                      CustomButton(
                        text: buttonTitle,
                        color: buttonColor,
                        onTap: () {
                          onButtonPressed();
                        },
                      ),
                  AppSize.s4.height,
                  showCloseButton
                      ? CustomButton(
                          color: AppColors.grey,
                          text: closeButtonTitle ??
                              context.textTr(AppStrings.cancel),
                          colorText: AppColors.labelColor,
                          onTap: () {
                            Navigator.of(context).pop(false);
                          },
                        )
                      : const SizedBox(),
                ],
              ),
        ),
      ),
    ),
  );
}
