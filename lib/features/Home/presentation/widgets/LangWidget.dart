import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test/core/utils/helper.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/injection_container.dart';
import '../../../../core/widgets/buildBoxDecoration.dart';

class LangWidget extends StatefulWidget {
  const LangWidget({
    super.key,
  });

  @override
  State<LangWidget> createState() => _LangWidgetState();
}

class _LangWidgetState extends State<LangWidget> {
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        Assets.iconsOptionIcons,
      ),
      title: Text(
        context.textTr(AppStrings.language),
        style: context.titleMedium().copyWith(
              fontWeight: AppFontWeight.semiBold,
            ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return buildChooseLanguage();
          },
        );
      },
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: AppColors.labelColor,
      ),
    );
  }

  Widget buildChooseLanguage() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppPadding.p16),
          topRight: Radius.circular(AppPadding.p16),
        ),
        color: AppColors.backgroundColor,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 88,
                    height: 6,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE4E7E7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
                AppSize.s24.height,
                Text(
                  context.textTr(AppStrings.changeLanguage),
                  style: context.titleLarge(),
                ),
                AppSize.s16.height,
                _buildLanguageOption(
                  langCode: 'ar',
                  langName: 'العربية',
                  flagPath: Assets.iconsARFlag,
                ),
                AppSize.s16.height,
                _buildLanguageOption(
                  langCode: 'en',
                  langName: 'English',
                  flagPath: Assets.iconsENFlag,
                ),
                AppSize.s40.height,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption({
    required String langCode,
    required String langName,
    required String flagPath,
  }) {
    String selectedLanguage = context.locale.languageCode;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = langCode;
          _appPreferences.changeAppLanguage();
          if (selectedLanguage == 'ar') {
            context.setLocale(const Locale('ar'));
          } else if (selectedLanguage != 'ar') {
            context.setLocale(const Locale('en'));
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p16,
        ),
        decoration: buildLightShapeDecoration(),
        child: Row(
          children: [
            SvgPicture.asset(
              flagPath,
              width: 40,
            ),
            AppSize.s8.width,
            Expanded(
              child: Text(langName, style: context.titleLarge()),
            ),
            SizedBox(
              width: 25,
              height: 25,
              child: SvgPicture.asset(
                langCode == selectedLanguage
                    ? Assets.iconsCheckCircle
                    : Assets.iconsRadioButtons,
                fit: BoxFit.fill,
                color: langCode == selectedLanguage
                    ? AppColors.primaryColor
                    : AppColors.subLightColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
