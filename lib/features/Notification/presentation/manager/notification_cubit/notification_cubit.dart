import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/notification_model/notification_model.dart';
import '../../../data/repo/notifications_repo.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.notificationRepo) : super(NotificationInitial());
  NotificationRepo notificationRepo;

  static NotificationCubit get(context) => BlocProvider.of(context);

  Future<void> getNotification() async {
    emit(GetNotificationLoading());
    var result = await notificationRepo.getNotification();
    result.fold((failure) {
      emit(GetNotificationFailure(failure.message));
    }, (notification) {
      emit(GetNotificationSuccess(notification));
    });
  }

  Future<void> deleteNotification({
    required String notificationId,
  }) async {
    emit(DeleteNotificationLoading());
    var result = await notificationRepo.deleteNotification(
        notificationId: notificationId);
    result.fold((failure) {
      emit(DeleteNotificationFailure(failure.message));
    }, (notification) {
      emit(DeleteNotificationSuccess());
    });
  }
}
