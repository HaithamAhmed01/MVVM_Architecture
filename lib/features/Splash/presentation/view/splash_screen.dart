import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/app_assets.dart';
import 'package:test/core/utils/helper.dart';
import 'package:lottie/lottie.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../config/routes/app_rout.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../../../core/utils/function/Version.dart';
import '../../../../core/utils/injection_container.dart';
import '../../../ForcUpdate/presentation/manager/force_update_cubit/force_update_cubit.dart';
import '../../manager/theme_cubit/theme_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  final AppPreferences _appPreferences = sl<AppPreferences>();

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    _startDelay();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return BlocConsumer<ForceUpdateCubit, ForceUpdateState>(
      listener: (context, state) {
        if (state is GetVersionSuccess) {
          final currentVersion = Version.parse(_packageInfo.version);
          final minVersion = Version.parse(state.versionModel.data!.minV!);

          log("currentVersion $currentVersion");
          log("minVersion $minVersion");

          if (currentVersion >= minVersion) {
            log("in update");
          } else {
            context.go(AppRouts.forceUpdateScreen);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: AppColors.backgroundColor,
              systemNavigationBarDividerColor: AppColors.backgroundColor,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            child: Stack(
              children: [
                Center(
                  child: Lottie.asset(Assets.animationSplash),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _startDelay() {
    _timer = Timer(2000.milliseconds, _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then(
          (isUserLoggedIn) => {
            if (isUserLoggedIn)
              {
                // navigate to main screen
                context.go(AppRouts.layoutScreen)
              }
            else
              {
                _appPreferences.isOnBoardingScreenViewed().then(
                      (isOnBoardingScreenViewed) => {
                        if (isOnBoardingScreenViewed)
                          {
                            // navigate to login screen
                            // context.pushReplacement(AppRouts.onBoardingScreen)
                            context.go(AppRouts.loginScreen)
                          }
                        else
                          {
                            // navigate to onBoarding screen
                            context.pushReplacement(AppRouts.onBoardingScreen)
                          },
                      },
                    ),
              },
          },
        );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
