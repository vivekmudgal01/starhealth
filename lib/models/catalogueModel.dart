// To parse this JSON data, do
//
//     final catalogueModel = catalogueModelFromJson(jsonString);

import 'dart:convert';

CatalogueModel catalogueModelFromJson(String str) =>
    CatalogueModel.fromJson(json.decode(str));

String catalogueModelToJson(CatalogueModel data) => json.encode(data.toJson());

class CatalogueModel {
  bool? status;
  String? message;
  List<Datum>? data;

  CatalogueModel({
    this.status,
    this.message,
    this.data,
  });

  factory CatalogueModel.fromJson(Map<String, dynamic> json) => CatalogueModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? productId;
  String? productName;
  String? brandName;
  String? productSku;
  String? mainImage;
  String? shortDescription;
  int? mrp;
  int? pricePoints;
  String? categoryId;
  String? categoryName;
  String? subCategoryId;
  String? subCategoryName;
  String? supplierId;
  String? supplierName;
  int? rating;

  Datum({
    this.productId,
    this.productName,
    this.brandName,
    this.productSku,
    this.mainImage,
    this.shortDescription,
    this.mrp,
    this.pricePoints,
    this.categoryId,
    this.categoryName,
    this.subCategoryId,
    this.subCategoryName,
    this.supplierId,
    this.supplierName,
    this.rating,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["productId"],
        productName: json["productName"],
        brandName: json["brandName"],
        productSku: json["productSKU"],
        mainImage: json["main_image"],
        shortDescription: json["shortDescription"],
        mrp: json["mrp"],
        pricePoints: json["pricePoints"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        subCategoryId: json["subCategoryId"],
        subCategoryName: json["subCategoryName"],
        supplierId: json["supplierId"],
        supplierName: json["supplierName"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "brandName": brandName,
        "productSKU": productSku,
        "main_image": mainImage,
        "shortDescription": shortDescription,
        "mrp": mrp,
        "pricePoints": pricePoints,
        "categoryId": categoryId,
        "categoryName": categoryName,
        "subCategoryId": subCategoryId,
        "subCategoryName": subCategoryName,
        "supplierId": supplierId,
        "supplierName": supplierName,
        "rating": rating,
      };
}
