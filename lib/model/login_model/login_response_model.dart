// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  String iss;
  int iat;
  int exp;
  Data data;

  LoginResponseModel({
    required this.iss,
    required this.iat,
    required this.exp,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    iss: json["iss"],
    iat: json["iat"],
    exp: json["exp"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "iss": iss,
    "iat": iat,
    "exp": exp,
    "data": data.toJson(),
  };
}

class Data {
  String id;
  String email;
  String role;
  String status;

  Data({
    required this.id,
    required this.email,
    required this.role,
    required this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    role: json["role"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "role": role,
    "status": status,
  };
}
