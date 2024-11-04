import 'notification_data.dart';

class NotificationModel {
  bool? success;
  int? code;
  String? message;
  List<NotificationData>? data;

  NotificationModel({this.success, this.code, this.message, this.data});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      success: json['success'] as bool?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'code': code,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
