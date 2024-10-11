class Country {
  final String code;
  final String name;
  final String shortName;

  Country({
    required this.code,
    required this.name,
    required this.shortName,
  });

  // Factory constructor to create Country from a Map (from XML parsing)
  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      code: map['Code'] as String,
      name: map['Name'] as String,
      shortName: map['ShortName'] as String,
    );
  }

  // Convert Country instance to a map
  Map<String, dynamic> toMap() {
    return {
      'Code': code,
      'Name': name,
      'ShortName': shortName,
    };
  }

  @override
  String toString() {
    return 'Country(Code: $code, Name: $name, ShortName: $shortName)';
  }
}
