import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/failures.dart';
import '../models/version_model/version_model.dart';
import 'version_repo.dart';

class VersionRepoImpl implements VersionRepo {
  final ApiConsumer _apiConsumer;

  VersionRepoImpl(this._apiConsumer);

  @override
  Future<Either<Failure, VersionModel>> getVersion() async {
    try {
      var data = await _apiConsumer.get(
        EndPoints.version,
      );
      VersionModel versionModel = VersionModel.fromJson(data);
      return right(versionModel);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
