import 'package:dartz/dartz.dart';
import 'package:test/features/Auth/data/models/user_model/user_model.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> login({required String phone});

  Future<Either<Failure, String>> register({
    required String phone,
    required String email,
    required String name,
  });

  Future<Either<Failure, UserModel>> otp({
    required String otp,
    required String phone,
  });

  Future<Either<Failure, String>> resendOtp({required String phone});
}
