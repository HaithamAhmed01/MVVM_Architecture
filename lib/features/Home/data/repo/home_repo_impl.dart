import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test/core/errors/failures.dart';
import 'package:test/features/Home/data/models/banner_model/banner_model.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer _apiConsumer;

  HomeRepoImpl(this._apiConsumer);

  @override
  Future<Either<Failure, BannerModel>> getBanner() async {
    try {
      var data = await _apiConsumer.get(
        EndPoints.banners,
      );
      BannerModel bannerModel = BannerModel.fromJson(data);
      return right(bannerModel);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
