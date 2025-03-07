// To parse this JSON data, do
//
//     final uploadModel = uploadModelFromJson(jsonString);

import 'dart:convert';

UploadModel uploadModelFromJson(String str) =>
    UploadModel.fromJson(json.decode(str));

String uploadModelToJson(UploadModel data) => json.encode(data.toJson());

class UploadModel {
  bool? status;
  String? message;
  Data? data;
  String? referenceId;

  UploadModel({
    this.status,
    this.message,
    this.data,
    this.referenceId,
  });

  factory UploadModel.fromJson(Map<String, dynamic> json) => UploadModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        referenceId: json["referenceId"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "referenceId": referenceId,
      };
}

class Data {
  List<String>? link;

  Data({
    this.link,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        link: json["link"] == null
            ? []
            : List<String>.from(json["link"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "link": link == null ? [] : List<dynamic>.from(link!.map((x) => x)),
      };
}
