// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  int? code;
  Data? data;

  UserProfileModel({
    this.code,
    this.data,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    code: json["code"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data?.toJson(),
  };
}

class Data {
  String? driverId;
  String? driverUserId;
  String? driverName;
  dynamic driverEmail;
  String? driverImage;
  String? govId;
  String? govIdImage;
  String? idExpiryDate;
  String? phoneNumber;
  String? phone2;
  String? vehicleType;
  String? vehicleRegistration;
  String? driverStatus;
  String? driverTotalDelivered;
  String? driverEarnings;
  String? driverLat;
  String? driverLong;
  String? driverNationality;
  DateTime? driverCreatedAt;
  DateTime? driverUpdatedAt;
  String? deleteStatus;
  String? driverAvailable;
  String? addedBy;
  String? driverType;

  Data({
    this.driverId,
    this.driverUserId,
    this.driverName,
    this.driverEmail,
    this.driverImage,
    this.govId,
    this.govIdImage,
    this.idExpiryDate,
    this.phoneNumber,
    this.phone2,
    this.vehicleType,
    this.vehicleRegistration,
    this.driverStatus,
    this.driverTotalDelivered,
    this.driverEarnings,
    this.driverLat,
    this.driverLong,
    this.driverNationality,
    this.driverCreatedAt,
    this.driverUpdatedAt,
    this.deleteStatus,
    this.driverAvailable,
    this.addedBy,
    this.driverType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    driverId: json["driver_id"],
    driverUserId: json["driver_user_id"],
    driverName: json["driver_name"],
    driverEmail: json["driver_email"],
    driverImage: json["driver_image"],
    govId: json["gov_id"],
    govIdImage: json["gov_id_image"],
    idExpiryDate: json["id_expiry_date"],
    phoneNumber: json["phone_number"],
    phone2: json["phone2"],
    vehicleType: json["vehicle_type"],
    vehicleRegistration: json["vehicle_registration"],
    driverStatus: json["driver_status"],
    driverTotalDelivered: json["driver_total_delivered"],
    driverEarnings: json["driver_earnings"],
    driverLat: json["driver_lat"],
    driverLong: json["driver_long"],
    driverNationality: json["driver_nationality"],
    driverCreatedAt: json["driver_created_at"] == null ? null : DateTime.parse(json["driver_created_at"]),
    driverUpdatedAt: json["driver_updated_at"] == null ? null : DateTime.parse(json["driver_updated_at"]),
    deleteStatus: json["delete_status"],
    driverAvailable: json["driver_available"],
    addedBy: json["added_by"],
    driverType: json["driver_type"],
  );

  Map<String, dynamic> toJson() => {
    "driver_id": driverId,
    "driver_user_id": driverUserId,
    "driver_name": driverName,
    "driver_email": driverEmail,
    "driver_image": driverImage,
    "gov_id": govId,
    "gov_id_image": govIdImage,
    "id_expiry_date": idExpiryDate,
    "phone_number": phoneNumber,
    "phone2": phone2,
    "vehicle_type": vehicleType,
    "vehicle_registration": vehicleRegistration,
    "driver_status": driverStatus,
    "driver_total_delivered": driverTotalDelivered,
    "driver_earnings": driverEarnings,
    "driver_lat": driverLat,
    "driver_long": driverLong,
    "driver_nationality": driverNationality,
    "driver_created_at": driverCreatedAt?.toIso8601String(),
    "driver_updated_at": driverUpdatedAt?.toIso8601String(),
    "delete_status": deleteStatus,
    "driver_available": driverAvailable,
    "added_by": addedBy,
    "driver_type": driverType,
  };
}
