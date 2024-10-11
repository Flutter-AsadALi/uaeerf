class Gender {
  final String code;
  final String name;

  Gender({required this.code, required this.name});

  // Factory constructor to create Gender from a map
  factory Gender.fromMap(Map<String, dynamic> map) {
    return Gender(
      code: map['Code'] as String,
      name: map['Name'] as String,
    );
  }

  // Convert Gender instance to a map (optional, if needed)
  Map<String, dynamic> toMap() {
    return {
      'Code': code,
      'Name': name,
    };
  }

  @override
  String toString() {
    return 'Gender(Code: $code, Name: $name)';
  }
}
