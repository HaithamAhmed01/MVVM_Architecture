import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/banner_model/banner_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, BannerModel>> getBanner();
}
