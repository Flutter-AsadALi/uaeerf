class EmailAvailabilityModel {
  final bool isEmailAvailable;

  EmailAvailabilityModel({required this.isEmailAvailable});

  // Factory constructor to create from a map
  factory EmailAvailabilityModel.fromMap(Map<String, dynamic> map) {
    return EmailAvailabilityModel(
      isEmailAvailable: map['CheckIfEmailAvailableResult'] as bool,
    );
  }

  // Convert to map (optional, if needed)
  Map<String, dynamic> toMap() {
    return {
      'CheckIfEmailAvailableResult': isEmailAvailable,
    };
  }

  @override
  String toString() {
    return 'EmailAvailabilityMainData(isEmailAvailable: $isEmailAvailable)';
  }
}
class PhoneAvailabilityModel {
  final bool isMobileAvailable;

  PhoneAvailabilityModel({required this.isMobileAvailable});

  // Factory constructor to create from a map
  factory PhoneAvailabilityModel.fromMap(Map<String, dynamic> map) {
    return PhoneAvailabilityModel(
      isMobileAvailable: map['CheckIfMobileNoAvailableResult'] as bool,
    );
  }

  // Convert to map (optional, if needed)
  Map<String, dynamic> toMap() {
    return {
      'CheckIfMobileNoAvailableResult': isMobileAvailable,
    };
  }

  @override
  String toString() {
    return 'MobileAvailabilityMainData(isMobileAvailable: $isMobileAvailable)';
  }
}
