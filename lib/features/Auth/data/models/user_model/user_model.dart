import 'user.dart';

class UserModel {
  User? data;
  List<dynamic>? links;
  String? message;
  String? accessToken;
  dynamic status;
  int? code;

  UserModel({
    this.data,
    this.links,
    this.message,
    this.accessToken,
    this.status,
    this.code,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: json['data'] == null
            ? null
            : User.fromJson(json['data'] as Map<String, dynamic>),
        links: json['links'] as List<dynamic>?,
        message: json['message'] as String?,
        accessToken: json['access_token'] as String?,
        status: json['status'] as dynamic,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'links': links,
        'message': message,
        'access_token': accessToken,
        'status': status,
        'code': code,
      };
}
