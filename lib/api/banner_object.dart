import 'dart:convert';

Banner bannerFromJson(String str) => Banner.fromJson(json.decode(str));

String bannerToJson(Banner data) => json.encode(data.toJson());

class Banner {
  Banner({
    required this.banner,
  });

  final BannerClass banner;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        banner: BannerClass.fromJson(json["banner"]),
      );

  Map<String, dynamic> toJson() => {
        "banner": banner.toJson(),
      };
}

class BannerClass {
  BannerClass({
    required this.imgUrl,
  });

  final String imgUrl;

  factory BannerClass.fromJson(Map<String, dynamic> json) => BannerClass(
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "imgUrl": imgUrl,
      };
}
