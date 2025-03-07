// To parse this JSON data, do
//
//     final enquiryModel = enquiryModelFromJson(jsonString);

import 'dart:convert';

EnquiryModel enquiryModelFromJson(String str) =>
    EnquiryModel.fromJson(json.decode(str));

String enquiryModelToJson(EnquiryModel data) => json.encode(data.toJson());

class EnquiryModel {
  bool? status;
  String? message;
  List<Datum>? data;
  String? referenceId;

  EnquiryModel({
    this.status,
    this.message,
    this.data,
    this.referenceId,
  });

  factory EnquiryModel.fromJson(Map<String, dynamic> json) => EnquiryModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        referenceId: json["referenceId"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "referenceId": referenceId,
      };
}

class Datum {
  String? dropdownId;
  String? name;

  Datum({
    this.dropdownId,
    this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        dropdownId: json["dropdownId"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "dropdownId": dropdownId,
        "name": name,
      };
}
