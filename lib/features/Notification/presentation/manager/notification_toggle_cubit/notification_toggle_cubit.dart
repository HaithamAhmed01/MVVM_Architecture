import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notification_toggle_state.dart';

class NotificationToggleCubit extends Cubit<NotificationToggleState> {
  final SharedPreferences preferences;

  NotificationToggleCubit({required this.preferences})
      : super(NotificationToggleState.enabled) {
    _initializeNotification();
  }

  static NotificationToggleCubit get(context) =>
      BlocProvider.of<NotificationToggleCubit>(context);

  void _initializeNotification() {
    final savedNotification = preferences.getString('notification');
    if (savedNotification != null) {
      emit(NotificationToggleState.values.firstWhere((notification) =>
          notification.toString() ==
          'NotificationToggleState.$savedNotification'));
    }
  }

  Future<void> setNotification(
      NotificationToggleState notificationToggleState) async {
    await preferences.setString(
        'notification', notificationToggleState.toString().split('.').last);
    emit(notificationToggleState);
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> subscribeToNotifications() async {
    await _firebaseMessaging.subscribeToTopic('all');
    log('subscribe done');
  }

  Future<void> unsubscribeFromNotifications() async {
    await _firebaseMessaging.unsubscribeFromTopic('all');
    log('unsubscribe done');
  }

  void toggleNotifications() {
    if (state != NotificationToggleState.enabled) {
      // Enable notifications
      subscribeToNotifications();
      setNotification(NotificationToggleState.enabled);
      emit(NotificationToggleState.enabled);
    } else {
      // Disable notifications
      unsubscribeFromNotifications();
      setNotification(NotificationToggleState.disabled);
      emit(NotificationToggleState.disabled);
    }
  }
}
