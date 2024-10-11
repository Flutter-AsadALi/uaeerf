// To parse this JSON data, do
//
//     final apiCodeMessageModel = apiCodeMessageModelFromJson(jsonString);

import 'dart:convert';

ApiCodeMessageModel apiCodeMessageModelFromJson(String str) => ApiCodeMessageModel.fromJson(json.decode(str));

String apiCodeMessageModelToJson(ApiCodeMessageModel data) => json.encode(data.toJson());

class ApiCodeMessageModel {
  int? code;
  String? message;

  ApiCodeMessageModel({
    this.code,
    this.message,
  });

  factory ApiCodeMessageModel.fromJson(Map<String, dynamic> json) => ApiCodeMessageModel(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}
