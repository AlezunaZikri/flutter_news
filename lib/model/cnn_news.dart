// To parse this JSON data, do
//
//     final responseCnn = responseCnnFromJson(jsonString);

import 'dart:convert';

ResponseCnn responseCnnFromJson(String str) =>
    ResponseCnn.fromJson(json.decode(str));

String responseCnnToJson(ResponseCnn data) => json.encode(data.toJson());

class ResponseCnn {
  String message;
  int total;
  List<Datum> data;

  ResponseCnn({
    required this.message,
    required this.total,
    required this.data,
  });

  factory ResponseCnn.fromJson(Map<String, dynamic> json) => ResponseCnn(
        message: json["message"],
        total: json["total"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String title;
  String link;
  String contentSnippet;
  DateTime isoDate;
  Img image;

  Datum({
    required this.title,
    required this.link,
    required this.contentSnippet,
    required this.isoDate,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        link: json["link"],
        contentSnippet: json["contentSnippet"],
        isoDate: DateTime.parse(json["isoDate"]),
        image: Img.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "contentSnippet": contentSnippet,
        "isoDate": isoDate.toIso8601String(),
        "image": image.toJson(),
      };
}

class Img {
  String small;
  String large;

  Img({
    required this.small,
    required this.large,
  });

  factory Img.fromJson(Map<String, dynamic> json) => Img(
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
      };
}
