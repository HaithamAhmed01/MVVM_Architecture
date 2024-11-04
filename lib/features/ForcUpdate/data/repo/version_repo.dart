import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/version_model/version_model.dart';

abstract class VersionRepo {
  Future<Either<Failure, VersionModel>> getVersion();
}
