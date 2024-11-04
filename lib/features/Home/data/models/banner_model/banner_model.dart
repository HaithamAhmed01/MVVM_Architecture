import 'banners.dart';
import 'links.dart';

class BannerModel {
  List<Banners>? data;
  Links? links;
  dynamic message;
  dynamic accessToken;
  dynamic status;
  int? code;

  BannerModel({
    this.data,
    this.links,
    this.message,
    this.accessToken,
    this.status,
    this.code,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Banners.fromJson(e as Map<String, dynamic>))
            .toList(),
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
        message: json['message'] as dynamic,
        accessToken: json['access_token'] as dynamic,
        status: json['status'] as dynamic,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'message': message,
        'access_token': accessToken,
        'status': status,
        'code': code,
      };
}
