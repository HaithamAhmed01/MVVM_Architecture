import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/core/utils/constants.dart';
import 'core/notifications/firbase_notification.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/injection_container.dart' as di;
import 'core/utils/injection_container.dart';
import 'features/Notification/data/repo/notifications_repo_impl.dart';
import 'features/Notification/presentation/manager/notification_cubit/notification_cubit.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  await FirebaseMessaging.instance.requestPermission();
  FirebaseMessaging.instance.getToken().then((value) {
    Constants.tokenFirBase = value;
  });
  //print('TokenFirBase is :  ${Constants.tokenFirBase}');
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    NotificationCubit(
      sl.get<NotificationRepoImpl>(),
    ).getNotification();
  });
  FirebaseMessaging.onMessage.listen((message) {
    NotificationCubit(
      sl.get<NotificationRepoImpl>(),
    ).getNotification();
  });
  await di.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    Bloc.observer = AppObserver();
    runApp(const MyApp());
  });
}
