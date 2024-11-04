import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/features/Home/data/repo/home_repo_impl.dart';
import 'package:test/features/Home/presentation/manager/BannerCubit/banner_cubit.dart';
import 'package:test/features/Notification/data/repo/notifications_repo_impl.dart';
import 'package:test/features/Notification/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/locale/app_localizations_setup.dart';
import 'config/routes/app_rout.dart';
import 'core/utils/injection_container.dart';
import 'features/ForcUpdate/data/repo/version_repo_impl.dart';
import 'features/ForcUpdate/presentation/manager/force_update_cubit/force_update_cubit.dart';
import 'features/Layout/manager/layout_cubit/cubit.dart';
import 'features/splash/manager/theme_cubit/theme_cubit.dart';
import 'features/splash/manager/theme_cubit/theme_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: 'assets/lang',
      saveLocale: true,
      startLocale: AppLocalizationsSetup.supportedLocales.first,
      fallbackLocale: AppLocalizationsSetup.supportedLocales.first,
      supportedLocales: AppLocalizationsSetup.supportedLocales,
      child: const StartApp(),
    );
  }
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ThemeCubit(
            preferences: sl.get<SharedPreferences>(),
          ),
        ),
        BlocProvider(
          create: (BuildContext context) => ForceUpdateCubit(
            sl.get<VersionRepoImpl>(),
          )..getVersion(),
        ),
        BlocProvider(
          create: (BuildContext context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => BannerCubit(
            sl.get<HomeRepoImpl>(),
          )..getBanner(),
        ),
        BlocProvider(
          create: (BuildContext context) => NotificationCubit(
            sl.get<NotificationRepoImpl>(),
          )..getNotification(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) {
          return BlocBuilder<ThemeCubit, AppTheme>(
            builder: (context, state) {
              return MaterialApp.router(
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                theme: BlocProvider.of<ThemeCubit>(context)
                    .mapStateToThemeData(state),
                routerConfig: AppRouts.router,
              );
            },
          );
        }),
      ),
    );
  }
}
