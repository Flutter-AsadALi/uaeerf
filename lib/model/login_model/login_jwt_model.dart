// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);
// To parse this JSON data, do
//
//     final loginJwtModel = loginJwtModelFromJson(jsonString);

import 'dart:convert';

LoginJwtModel loginJwtModelFromJson(String str) => LoginJwtModel.fromJson(json.decode(str));

String loginJwtModelToJson(LoginJwtModel data) => json.encode(data.toJson());

class LoginJwtModel {
    LoginJwtModel({
        required this.code,
        required this.message,
        required this.token,
    });

    String? code;
    String? message;
    String? token;

    factory LoginJwtModel.fromJson(Map<String, dynamic> json) => LoginJwtModel(
        code: json["code"].toString(),
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "token": token,
    };
}
