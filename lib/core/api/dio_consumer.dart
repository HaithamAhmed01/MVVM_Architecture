import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import '/core/utils/injection_container.dart' as di;
import 'api_consumer.dart';
import 'app_interceptors.dart';
import 'end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
      ..baseUrl = EndPoints.BASE_URL
      ..responseType = ResponseType.plain
      ..followRedirects = false;
    client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final response = await client.get(
      path,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    return _handleResponseAsJson(response);
  }

  @override
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
    bool formDataIsEnabled = false,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await client.post(
      path,
      data: formDataIsEnabled ? FormData.fromMap(body!) : body,
      options: Options(
        headers: headers,
      ),
      queryParameters: queryParameters,
    );
    return _handleResponseAsJson(response);
  }

  @override
  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await client.delete(
      path,
      data: body,
      options: Options(
        headers: headers,
      ),
      queryParameters: queryParameters,
    );
    return _handleResponseAsJson(response);
  }

  @override
  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool responseIsParsing = true,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await client.put(
      path,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    return _handleResponseAsJson(response);
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }
}
