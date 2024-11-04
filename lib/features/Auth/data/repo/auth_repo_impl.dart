import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test/core/api/api_consumer.dart';
import 'package:test/core/api/end_points.dart';
import 'package:test/core/errors/failures.dart';
import 'package:test/core/utils/constants.dart';
import 'package:test/features/Auth/data/models/user_model/user_model.dart';
import 'package:test/features/Auth/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer _apiConsumer;

  AuthRepoImpl(this._apiConsumer);

  @override
  Future<Either<Failure, String>> login({required String phone}) async {
    try {
      var data = await _apiConsumer.post(
        EndPoints.login,
        body: {
          "phone": phone,
        },
      );
      return right(data['message'].toString());
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> register({
    required String phone,
    required String email,
    required String name,
  }) async {
    try {
      var data = await _apiConsumer.post(
        EndPoints.register,
        body: {
          "type": "client",
          "phone": phone,
          "email": email,
          "name": name,
        },
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
  Future<Either<Failure, UserModel>> otp({
    required String otp,
    required String phone,
  }) async {
    try {
      var data = await _apiConsumer.post(
        EndPoints.verifyOtp,
        body: {
          "code": otp,
          "phone": phone,
          "app_type": "client",
          "push_type": Platform.operatingSystem,
          "fcm_token": Constants.tokenFirBase,
        },
      );
      UserModel userModel = UserModel.fromJson(data);
      return right(userModel);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> resendOtp({required String phone}) async {
    try {
      var data = await _apiConsumer.post(
        EndPoints.resendOtp,
        body: {
          "phone": phone,
        },
      );
      return right(data.toString());
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
