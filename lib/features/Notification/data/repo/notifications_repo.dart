import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/notification_model/notification_model.dart';

abstract class NotificationRepo {
  Future<Either<Failure, NotificationModel>> getNotification();

  Future<Either<Failure, String>> deleteNotification({
    required String notificationId,
  });
}
