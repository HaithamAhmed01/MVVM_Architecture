import 'dart:convert';
import 'package:dio/dio.dart';
import '../utils/app_string.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDiorError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure(ResponseMessage.CONNECT_TIMEOUT);
      case DioErrorType.sendTimeout:
        return ServerFailure(ResponseMessage.SEND_TIMEOUT);
      case DioErrorType.receiveTimeout:
        return ServerFailure(ResponseMessage.RECIEVE_TIMEOUT);
      case DioErrorType.badCertificate:
        return ServerFailure(ResponseMessage.badRequest);
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioErrorType.cancel:
        return ServerFailure(ResponseMessage.CANCEL);
      case DioErrorType.connectionError:
        return ServerFailure(ResponseMessage.NO_INTERNET_CONNECTION);
      case DioErrorType.unknown:
        return ServerFailure(ResponseMessage.DEFAULT);
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(ResponseMessage.notFound);
    } else if (statusCode == 500) {
      return ServerFailure(ResponseMessage.internalServerError);
    } else if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 422) {
      Map valueMap = json.decode(response);
      return ServerFailure("$statusCode: ${valueMap['message']}");
    } else {
      return ServerFailure(ResponseMessage.DEFAULT);
    }
  }
}

class ResponseMessage {
  static const String success = AppStrings.success; // success with data
  static const String noContent =
      AppStrings.success; // success with no data (no content)
  static const String badRequest =
      AppStrings.badRequestError; // failure, API rejected request
  static const String unauthorized =
      AppStrings.unauthorizedError; // failure, user is not authorised
  static const String forbidden =
      AppStrings.forbiddenError; //  failure, API rejected request
  static const String internalServerError =
      AppStrings.internalServerError; // failure, crash in server side
  static const String notFound =
      AppStrings.notFoundError; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = AppStrings.timeoutError;
  static const String CANCEL = AppStrings.defaultError;
  static const String RECIEVE_TIMEOUT = AppStrings.timeoutError;
  static const String SEND_TIMEOUT = AppStrings.timeoutError;
  static const String CACHE_ERROR = AppStrings.cacheError;
  static const String NO_INTERNET_CONNECTION = AppStrings.noInternetError;
  static const String DEFAULT = AppStrings.defaultError;
}
