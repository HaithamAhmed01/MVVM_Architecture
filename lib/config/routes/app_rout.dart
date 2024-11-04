import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test/features/Auth/data/repo/auth_repo_impl.dart';
import 'package:test/features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:test/features/Home/presentation/view/HomeView.dart';
import '../../core/utils/injection_container.dart';
import '../../features/Auth/presentation/view/login_view.dart';
import '../../features/Auth/presentation/view/otp_view.dart';
import '../../features/Auth/presentation/view/privacy_view.dart';
import '../../features/Auth/presentation/view/sign_up_view.dart';
import '../../features/Auth/presentation/view/terms_view.dart';
import '../../features/ForcUpdate/presentation/manager/force_update_cubit/force_update_cubit.dart';
import '../../features/ForcUpdate/presentation/view/force_update_screen.dart';
import '../../features/OnBoarding/presentation/view/on_boarding_screen.dart';
import '../../features/Layout/view/LayoutView.dart';
import '../../features/Notification/presentation/view/NotificationView.dart';
import '../../features/splash/presentation/view/splash_screen.dart';

abstract class AppRouts {
  static const String initialRoute = '/';

  static const String onBoardingScreen = '/onBoardingScreen';
  static const String layoutScreen = '/layoutScreen';
  static const String homeViewScreen = '/homeViewScreen';
  static const String forceUpdateScreen = '/forceUpdateScreen';
  static const String loginScreen = '/loginScreen';
  static const String otbScreen = '/otbScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String accountInfoScreen = '/accountInfoScreen';
  static const String aboutUsViewScreen = '/aboutUsViewScreen';
  static const String contactUsViewScreen = '/contactUsViewScreen';
  static const String termsViewScreen = '/termsViewScreen';
  static const String privacyViewScreen = '/privacyViewScreen';
  static const String notificationViewScreen = '/notificationViewScreen';
  static const String locationViewScreen = '/locationViewScreen';
  static const String lockerSubscriptionsViewScreen =
      '/lockerSubscriptionsViewScreen';
  static const String lockerReviewViewScreen = '/lockerReviewViewScreen';
  static const String lockerCreditCardViewScreen =
      '/lockerCreditCardViewScreen';
  static const String lockerPaymentSuccessViewScreen =
      '/lockerPaymentSuccessViewScreen';
  static const String emptyLockerViewScreen = '/emptyLockerViewScreen';
  static const String statusLockerViewScreen = '/statusLockerViewScreen';
  static const String lockerDetailsViewScreen = '/lockerDetailsViewScreen';
  static const String servicesViewScreen = '/servicesViewScreen';
  static const String servicesDetailsViewScreen = '/servicesDetailsViewScreen';
  static const String servicesCardViewScreen = '/servicesCardViewScreen';
  static const String servicesReviewViewScreen = '/servicesReviewViewScreen';
  static const String servicesCreditCardViewScreen =
      '/servicesCreditCardViewScreen';
  static const String servicesPaymentSuccessViewScreen =
      '/servicesPaymentSuccessViewScreen';
  static const String orderDetailsViewScreen = '/orderDetailsViewScreen';
  static const String orderDetailsListViewScreen =
      '/orderDetailsListViewScreen';
  static const String invoiceViewScreen = '/invoiceViewScreen';
  static const String sendReportsViewScreen = '/sendReportsViewScreen';
  static const String reportsViewScreen = '/reportsViewScreen';
  static const String sendReportSuccessViewScreen =
      '/sendReportSuccessViewScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: initialRoute,
        pageBuilder: (context, state) {
          return customTransitionPage(
            state: state,
            child: BlocBuilder<ForceUpdateCubit, ForceUpdateState>(
              builder: (context, state) {
                return const SplashScreen();
              },
            ),
          );
        },
      ),
      GoRoute(
        path: onBoardingScreen,
        pageBuilder: (context, state) {
          return customTransitionPage(
            state: state,
            child: const OnBoardingScreen(),
          );
        },
      ),
      GoRoute(
        path: loginScreen,
        pageBuilder: (context, state) {
          return customTransitionPage(
            state: state,
            child: BlocProvider(
              create: (context) => AuthCubit(sl.get<AuthRepoImpl>()),
              child: const LoginView(),
            ),
          );
        },
      ),
      GoRoute(
        path: signUpScreen,
        pageBuilder: (context, state) {
          return customTransitionPage(
            state: state,
            child: BlocProvider(
              create: (context) => AuthCubit(sl.get<AuthRepoImpl>()),
              child: BlocProvider(
                create: (context) => AuthCubit(sl.get<AuthRepoImpl>()),
                child: SignUpView(),
              ),
            ),
          );
        },
      ),
      GoRoute(
        path: otbScreen,
        pageBuilder: (context, state) {
          return customTransitionPage(
            state: state,
            child: BlocProvider(
              create: (context) => AuthCubit(sl.get<AuthRepoImpl>()),
              child: BlocProvider(
                create: (context) => AuthCubit(sl.get<AuthRepoImpl>()),
                child: OTPView(),
              ),
            ),
          );
        },
      ),
      GoRoute(
        path: layoutScreen,
        pageBuilder: (context, state) {
          return customTransitionPage(
            state: state,
            child: const LayoutView(),
          );
        },
      ),
      GoRoute(
        path: homeViewScreen,
        pageBuilder: (context, state) {
          return customTransitionPage(
            state: state,
            child: const HomeView(),
          );
        },
      ),
      GoRoute(
        path: forceUpdateScreen,
        pageBuilder: (context, state) {
          return customTransitionPage(
            state: state,
            child: const ForceUpdateScreen(),
          );
        },
      ),
      GoRoute(
        path: notificationViewScreen,
        pageBuilder: (context, state) {
          return customTransitionPage(
            state: state,
            child: const NotificationView(),
          );
        },
      ),
      GoRoute(
        path: termsViewScreen,
        pageBuilder: (context, state) {
          return customTransitionPage(
            state: state,
            child: const TermsView(),
          );
        },
      ),
      GoRoute(
        path: privacyViewScreen,
        pageBuilder: (context, state) {
          return customTransitionPage(
            state: state,
            child: const PrivacyView(),
          );
        },
      ),
    ],
  );

  static CupertinoPage<dynamic> customTransitionPage({
    required GoRouterState state,
    required Widget child,
  }) {
    return CupertinoPage(
      key: state.pageKey,
      child: child,
    );
  }
}
