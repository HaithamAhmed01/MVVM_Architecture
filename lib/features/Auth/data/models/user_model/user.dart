import '../user_model/locker.dart';

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? isActive;
  List<Locker>? locker;
  String? status;
  String? avatar;
  String? address;
  double? latitude;
  double? longitude;
  int? leftTimeForSubscriptionToEnd;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.isActive,
    this.locker,
    this.status,
    this.avatar,
    this.address,
    this.latitude,
    this.longitude,
    this.leftTimeForSubscriptionToEnd,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        isActive: json['is_active'] as int?,
        locker: (json['locker'] as List<dynamic>?)
            ?.map((e) => Locker.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'] as String?,
        avatar: json['avatar'] as String?,
        address: json['address'] as String?,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        leftTimeForSubscriptionToEnd:
            json['left_time_for_subscription_to_end'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'is_active': isActive,
        'locker': locker?.map((e) => e.toJson()).toList(),
        'status': status,
        'avatar': avatar,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'left_time_for_subscription_to_end': leftTimeForSubscriptionToEnd,
      };
}
