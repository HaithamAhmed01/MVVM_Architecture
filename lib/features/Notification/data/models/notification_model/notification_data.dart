class NotificationData {
  String? id;
  String? title;
  String? message;
  String? date;
  String? time;

  NotificationData({this.id, this.title, this.message, this.date, this.time});

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
        id: json['id'] as String?,
        title: json['title'] as String?,
        message: json['message'] as String?,
        date: json['date'] as String?,
        time: json['time'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'message': message,
        'date': date,
        'time': time,
      };
}
