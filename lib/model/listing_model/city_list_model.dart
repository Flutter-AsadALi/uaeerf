class City {
  final String code;
  final String name;

  City({required this.code, required this.name});

  // Factory constructor to create City from parsed XML
  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      code: map['Code'] as String,
      name: map['Name'] as String,
    );
  }

  // Convert City instance to a map (optional, if you need it)
  Map<String, dynamic> toMap() {
    return {
      'Code': code,
      'Name': name,
    };
  }

  @override
  String toString() {
    return 'City(Code: $code, Name: $name)';
  }
}

// import 'package:xml/xml.dart' as xml;
// class City {
//   final int code;
//   final String name;
//
//   City({required this.code, required this.name});
//
//   factory City.fromXml(xml.XmlElement xml) {
//     return City(
//       code: int.parse(xml.findElements('Code').single.text),
//       name: xml.findElements('Name').single.text,
//     );
//   }
// }
//
// class CityList {
//   final List<City> cities;
//
//   CityList({required this.cities});
//
//   factory CityList.fromXml(xml.XmlElement xml) {
//     final cityElements = xml.findAllElements('City');
//     final cities = cityElements.map((cityXml) => City.fromXml(cityXml)).toList();
//
//     return CityList(cities: cities);
//   }
// }
