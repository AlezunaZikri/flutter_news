// To parse this JSON data, do
//
//     final responseAntara = responseAntaraFromJson(jsonString);

import 'dart:convert';

ResponseAntara responseAntaraFromJson(String str) =>
    ResponseAntara.fromJson(json.decode(str));

String responseAntaraToJson(ResponseAntara data) => json.encode(data.toJson());

class ResponseAntara {
  String message;
  int total;
  List<Datum> data;

  ResponseAntara({
    required this.message,
    required this.total,
    required this.data,
  });

  factory ResponseAntara.fromJson(Map<String, dynamic> json) => ResponseAntara(
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
  DateTime isoDate;
  String image;
  String description;

  Datum({
    required this.title,
    required this.link,
    required this.isoDate,
    required this.image,
    required this.description,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        link: json["link"],
        isoDate: DateTime.parse(json["isoDate"]),
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "isoDate": isoDate.toIso8601String(),
        "image": image,
        "description": description,
      };
}
