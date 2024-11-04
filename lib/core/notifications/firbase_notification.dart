import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../../features/Notification/data/repo/notifications_repo_impl.dart';
import '../../features/Notification/presentation/manager/notification_cubit/notification_cubit.dart';
import '../utils/injection_container.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('on background message');
  NotificationCubit(
    sl.get<NotificationRepoImpl>(),
  ).getNotification();
  log(message.data.toString());
}
