import 'data.dart';

class VersionModel {
  bool? success;
  int? code;
  String? message;
  Data? data;

  VersionModel({this.success, this.code, this.message, this.data});

  factory VersionModel.fromJson(Map<String, dynamic> json) => VersionModel(
        success: json['success'] as bool?,
        code: json['code'] as int?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'code': code,
        'message': message,
        'data': data?.toJson(),
      };
}
