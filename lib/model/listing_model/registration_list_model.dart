class RegistrationType {
  final String code;
  final String name;

  RegistrationType({required this.code, required this.name});

  // Factory constructor to create a RegistrationType from a map or parsed data
  factory RegistrationType.fromMap(Map<String, dynamic> map) {
    return RegistrationType(
      code: map['Code'] as String,
      name: map['Name'] as String,
    );
  }

  // Convert RegistrationType instance to a map (if needed)
  Map<String, dynamic> toMap() {
    return {
      'Code': code,
      'Name': name,
    };
  }

  @override
  String toString() {
    return 'RegistrationType(Code: $code, Name: $name)';
  }
}
