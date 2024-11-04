import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test/core/utils/app_prefs.dart';
import 'package:test/features/Auth/data/repo/auth_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/ForcUpdate/data/repo/version_repo_impl.dart';
import '../../features/Home/data/repo/home_repo_impl.dart';
import '../../features/Notification/data/repo/notifications_repo_impl.dart';
import '../api/api_consumer.dart';
import '../api/app_interceptors.dart';
import '../api/dio_consumer.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

  // Blocs

  // Data Sources
  sl.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(
      sl.get<ApiConsumer>(),
    ),
  );
  sl.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(
      sl.get<ApiConsumer>(),
    ),
  );
  sl.registerLazySingleton<NotificationRepoImpl>(
    () => NotificationRepoImpl(
      sl.get<ApiConsumer>(),
    ),
  );

  sl.registerLazySingleton<VersionRepoImpl>(
    () => VersionRepoImpl(
      sl.get<ApiConsumer>(),
    ),
  );

  // Use cases

  // Repository

  // Data Sources

  //! Core

  //! External

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton(
    () => LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true,
    ),
  );
  sl.registerLazySingleton(
    () => AppInterceptors(
      sl(),
      client: sl(),
    ),
  );
}
