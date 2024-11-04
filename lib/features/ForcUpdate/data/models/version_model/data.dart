class Data {
  String? minV;

  Data({this.minV});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        minV: json['min_version'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'min_version': minV,
      };
}
