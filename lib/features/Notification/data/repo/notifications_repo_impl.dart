import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:test/features/Notification/data/models/notification_model/notification_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/failures.dart';
import 'notifications_repo.dart';

class NotificationRepoImpl implements NotificationRepo {
  final ApiConsumer _apiConsumer;


  NotificationRepoImpl(this._apiConsumer);

  @override
  Future<Either<Failure, String>> deleteNotification(
      {required String notificationId}) async {
    try {
      var data = await _apiConsumer.delete(
        "${EndPoints.notifications}/$notificationId",
      );
      return right(data.toString());
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, NotificationModel>> getNotification() async {
    try {
      var data = await _apiConsumer.get(
        EndPoints.notifications,
      );
      NotificationModel notificationModel = NotificationModel.fromJson(data);
      return right(notificationModel);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
