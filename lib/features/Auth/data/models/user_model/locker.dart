class Locker {
  int? id;
  String? lockerNumber;
  String? password;

  Locker({this.id, this.lockerNumber, this.password});

  factory Locker.fromJson(Map<String, dynamic> json) => Locker(
        id: json['id'] as int?,
        lockerNumber: json['locker_number'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'locker_number': lockerNumber,
        'password': password,
      };
}
