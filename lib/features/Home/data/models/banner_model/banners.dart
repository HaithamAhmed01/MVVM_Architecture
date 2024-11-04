class Banners {
  int? id;
  String? image;

  Banners({this.id, this.image});

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        id: json['id'] as int?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
      };
}
