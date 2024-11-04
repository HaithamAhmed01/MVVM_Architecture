part of 'notification_cubit.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class GetNotificationLoading extends NotificationState {}

class GetNotificationFailure extends NotificationState {
  final String errMessage;

  GetNotificationFailure(this.errMessage);
}

class GetNotificationSuccess extends NotificationState {
  final NotificationModel notificationModel;

  GetNotificationSuccess(this.notificationModel);
}

class DeleteNotificationLoading extends NotificationState {}

class DeleteNotificationFailure extends NotificationState {
  final String errMessage;

  DeleteNotificationFailure(this.errMessage);
}

class DeleteNotificationSuccess extends NotificationState {
  DeleteNotificationSuccess();
}
