import 'dart:developer';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:xml/xml.dart' as xml;
import '../model/listing_model/PersonRegistrationResultModel.dart';
import '../model/listing_model/country_list_model.dart';
import '../model/listing_model/city_list_model.dart';
import '../model/listing_model/email_check_model.dart';
import '../model/listing_model/gender_list_model.dart';
import '../model/listing_model/registration_list_model.dart';
import '../network_client/network_clients.dart';
class AuthHelper {
  AuthHelper(NetworkClient find);
  ///
  ///
  ///
   registerNewUserHelper({
    required String soapAction,
    required int personType,
    required int formId,
    required int userId,
    required String name,
    required String fatherName,
    required String country,
    required String countryId,
    required String nationality,
    required String nationalityId,
    required var dob,
    required String sex,
    required String sexId,
    required String address,
    required String poBox,
    required String city,
    required String cityId,
    required String mobile,
    required String email,
    required String registrationType,
    required var dateSubmit,
    required String status,
    required int statusId,
    required int seasonCode,
    required int documentCheck,
    required String weight,
    required String eid,
    required int sourceId,
  }) async {
    try {
      final String soapBody = '''<?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <Submit_PersonNewRegistration xmlns="http://ws.uaeerf.ae/">
      <PersonType>$personType</PersonType>
      <person>
       <FormId>$formId</FormId>
        <UserId>$userId</UserId>
        <Name>$name</Name>
        <FatherName>$fatherName</FatherName>
        <Country>$country</Country>
        <CountryID>$countryId</CountryID>
        <Nationality>$nationality</Nationality>
        <NationalityID>$nationalityId</NationalityID>
        <Dob>$dob</Dob>
        <Sex>$sex</Sex>
        <SexID>$sexId</SexID>
        <Address>$address</Address>
        <PoBox>$poBox</PoBox>
        <City>$city</City>
        <CityID>$cityId</CityID>
        <Mobile>$mobile</Mobile>
        <Email>$email</Email>
        <RegistrationType>$registrationType</RegistrationType>
        <DateSubmit>$dateSubmit</DateSubmit>
        <Status>$status</Status>
        <StatusId>$statusId</StatusId>
        <SeasonCode>$seasonCode</SeasonCode>
        <DocumentCheck>$documentCheck</DocumentCheck>
        <Weight>$weight</Weight>
        <EID>$eid</EID>
        <SourceID>$sourceId</SourceID>
      </person>
      <msg>
        <string>Registration successful</string>
        <string>Thank you for registering</string>
      </msg>
    </Submit_PersonNewRegistration>
  </soap12:Body>
</soap12:Envelope>''';
      var resp = await Get.find<NetworkClient>().postSoap(
        'WSRegistrations.asmx',
        soapAction: soapAction, // SOAP action
        soapBody: soapBody, // SOAP request body
      );

      if (resp.isSuccess) {
        // Assuming the response is in XML format and you want to print or process it
        log('registerNewUserHelper ${resp.data}');
        var data=parsePersonRegistrationMainData(resp.data);
        return data;
      } else {
        log('Failed to registerNewUserHelper ${resp.message}');
        return false;
      }
    } catch (e) {
      log('Error during registerNewUserHelper: $e', error: e);
      return false;
    }
  }



  PersonRegistrationResult parsePersonRegistrationMainData(String response) {
    final document = xml.XmlDocument.parse(response);

    // Get the registration result
    final registrationResultText = document.findAllElements('Submit_PersonNewRegistrationResult').single.text;
    final isRegistrationSuccessful = registrationResultText == 'true';

    return PersonRegistrationResult(isRegistrationSuccessful: isRegistrationSuccessful);
  }
  ///
  ///
  ///
  login({
    required String soapAction,
    required String userName,
    required String password,
    // required String soapBody,
  }) async {
    try {
      final String soapBody = '''<?xml version="1.0" encoding="utf-8"?>
  <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
    <soap:Body>
      <Login xmlns="http://emiratesequestrian.info/">
        <username>$userName</username>
        <password>$password</password>
        <msg>
          <string>Login request from Application</string>
          <string>Testing SOAP request</string>
        </msg>
      </Login>
    </soap:Body>
  </soap:Envelope>''';
      final resp = await Get.find<NetworkClient>().postSoap(
        'WSAuthentication.asmx?op=Login',
        soapAction: soapAction, // SOAP action
        soapBody: soapBody, // SOAP request body
      );
      if (resp.isSuccess ) {
        print('Login successful');
        print('Login successful:=========== ${resp.data}');
        return true; // Return true if login is successful
      } else {
        // print('Failed to login: Status code ${result['message']}');
        return false; // Return false if login fails
      }
    } catch (e) {
      print('Error during login: $e');
    }
  }
  ///
  ///
  ///
   cityListHelper({
    required String soapAction,
  }) async {
    try {
      const String soapBody = '''<?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <getCityList xmlns="http://emiratesequestrian.info/">
      <msg>
        <string>Fetching city list</string>
        <string>Requesting data</string>
      </msg>
    </getCityList>
  </soap12:Body>
</soap12:Envelope>''';

      var resp = await Get.find<NetworkClient>().postSoap(
        'WSCommons.asmx',
        soapAction: soapAction, // SOAP action
        soapBody: soapBody, // SOAP request body
      );
      print("resp.isSuccess");
      print(resp.isSuccess);

      if (resp.isSuccess) {
        log('City list fetched successfully: ${resp.data}');
        var cities =   parseCities(resp.data);
        return cities;
      } else {
        log('Failed to fetch city list: ${resp.message}');
        return false;
      }
    } catch (e) {
      log('Error during cityListHelper: $e', error: e);
      return false;
    }
  }
  List<City> parseCities(String response) {
    final document = xml.XmlDocument.parse(response);
    final cityElements = document.findAllElements('City');

    return cityElements.map((element) {
      return City(
        code: element.findElements('Code').single.text,
        name: element.findElements('Name').single.text,
      );
    }).toList();
  }

  ///
  ///
  ///
   lisRegistrationTypeHelper({
    required String soapAction,
  }) async {
    try {
      const String soapBody = '''<?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <getRegistrationSource xmlns="http://emiratesequestrian.info/">
      <recordID>1</recordID>
      <msg>
        <string>Fetching registration source</string>
        <string>Requesting source data</string>
      </msg>
    </getRegistrationSource>
  </soap12:Body>
</soap12:Envelope>''';
      var resp = await Get.find<NetworkClient>().postSoap(
        'WSCommons.asmx',
        soapAction: soapAction, // SOAP action
        soapBody: soapBody, // SOAP request body
      );
      if (resp.isSuccess) {
        // Assuming the response is in XML format and you want to print or process it


        log('lisRegistrationTypeHelper successfully: ${resp.data}');
        var type =   parseType(resp.data);
        return type;
      } else {
        log('Failed to lisRegistrationTypeHelper: ${resp.message}');
        return false;
      }
    } catch (e) {
      log('Error during lisRegistrationTypeHelper: $e', error: e);
      return false;
    }
  }
  List<RegistrationType> parseType(String response) {
    final document = xml.XmlDocument.parse(response);
    final cityElements = document.findAllElements('RegistrationType');

    return cityElements.map((element) {
      return RegistrationType(
        code: element.findElements('Code').single.text,
        name: element.findElements('Name').single.text,
      );
    }).toList();
  }
  ///
  ///
  ///
   checkEmailHelper({
    required String soapAction,
    required int regTypeID,
    required int personID,
    required String eMailAdd,
  }) async {
    try {
      final String soapBody = '''<?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <CheckIfEmailAvailable xmlns="http://emiratesequestrian.info/">
      <RegTypeID>$regTypeID</RegTypeID>
      <PersonID>$personID</PersonID>
      <eMailAdd>$eMailAdd</eMailAdd>
      <msg>
        <string>Checking email availability</string>
        <string>Requesting email validation</string>
      </msg>
    </CheckIfEmailAvailable>
  </soap12:Body>
</soap12:Envelope>''';
      var resp = await Get.find<NetworkClient>().postSoap(
        'WSCommons.asmx',
        soapAction: soapAction, // SOAP action
        soapBody: soapBody, // SOAP request body
      );

      if (resp.isSuccess) {
        // Assuming the response is in XML format and you want to print or process it
        log('CheckIfEmailAvailable ${resp.data}');
        var mainData = parseMainData(resp.data);
        return mainData;
      } else {
        log('Failed to CheckIfEmailAvailable ${resp.message}');
        return false;
      }
    } catch (e) {
      log('Error during cityListHelper: $e', error: e);
      return false;
    }
  }
  // Function to parse the XML and return the main data
  EmailAvailabilityModel parseMainData(String response) {
    final document = xml.XmlDocument.parse(response);

    // Get the email availability result
    final isEmailAvailableText = document.findAllElements('CheckIfEmailAvailableResult').single.text;
    final isEmailAvailable = isEmailAvailableText == 'true';

    return EmailAvailabilityModel(isEmailAvailable: isEmailAvailable);
  }


  ///
  ///
  ///
   checkPhoneHelper({
    required String soapAction,
    required int regTypeID,
    required int personID,
    required String mobileNo,
  }) async {
    try {
      final String soapBody = '''<?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <CheckIfMobileNoAvailable xmlns="http://emiratesequestrian.info/">
      <RegTypeID>$regTypeID</RegTypeID>
      <PersonID>$personID</PersonID>
      <MobileNo>$mobileNo</MobileNo>
      <msg>
        <string>Checking mobile number availability</string>
        <string>Requesting validation</string>
      </msg>
    </CheckIfMobileNoAvailable>
  </soap12:Body>
</soap12:Envelope>''';
      var resp = await Get.find<NetworkClient>().postSoap(
        'WSCommons.asmx',
        soapAction: soapAction, // SOAP action
        soapBody: soapBody, // SOAP request body
      );

      if (resp.isSuccess) {
        // Assuming the response is in XML format and you want to print or process it
        log('CheckIfEmailAvailable ${resp.data}');
        var data=parseMobileAvailability(resp.data);
        return data;
        return true;
      } else {
        log('Failed to CheckIfEmailAvailable ${resp.message}');
        return false;
      }
    } catch (e) {
      log('Error during checkPhoneHelper: $e', error: e);
      return false;
    }
  }// Function to parse the XML and return the main data
  PhoneAvailabilityModel parseMobileAvailability(String response) {
    final document = xml.XmlDocument.parse(response);

    // Get the mobile availability result
    final isMobileAvailableText = document.findAllElements('CheckIfMobileNoAvailableResult').single.text;
    final isMobileAvailable = isMobileAvailableText == 'true';

    return PhoneAvailabilityModel(isMobileAvailable: isMobileAvailable);
  }

  ///
  ///
  ///
   listGenderHelper({
    required String soapAction,
  }) async {
    try {
      const String soapBody = '''<?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <getGenderList xmlns="http://emiratesequestrian.info/">
      <msg>
        <string>Fetching gender list</string>
        <string>Requesting data</string>
      </msg>
    </getGenderList>
  </soap12:Body>
</soap12:Envelope>
''';
      var resp = await Get.find<NetworkClient>().postSoap(
        'WSCommons.asmx',
        soapAction: soapAction, // SOAP action
        soapBody: soapBody, // SOAP request body
      );

      if (resp.isSuccess) {
        // Assuming the response is in XML format and you want to print or process it
        log('listGender ${resp.data}');
        List<Gender> genders = parseGenders(resp.data);
        return genders;
      } else {
        log('Failed to listGender ${resp.message}');
        return false;
      }
    } catch (e) {
      log('Error during listGender: $e', error: e);
      return false;
    }
  }

  // Function to parse the XML response and return a list of Gender objects
  List<Gender> parseGenders(String response) {
    final document = xml.XmlDocument.parse(response);
    final genderElements = document.findAllElements('Gender');

    return genderElements.map((element) {
      return Gender(
        code: element.findElements('Code').single.text,
        name: element.findElements('Name').single.text,
      );
    }).toList();
  }

  ///
  ///
  ///
   listCountryHelper({
    required String soapAction,
  }) async {
    try {
      const String soapBody = '''<?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <getCountryList xmlns="http://emiratesequestrian.info/">
      <msg>
        <string>Requesting country list</string>
        <string>Processing request</string>
      </msg>
    </getCountryList>
  </soap12:Body>
</soap12:Envelope>''';
      var resp = await Get.find<NetworkClient>().postSoap(
        'WSCommons.asmx',
        soapAction: soapAction, // SOAP action
        soapBody: soapBody, // SOAP request body
      );
      if (resp.isSuccess) {
        log('listCountryHelper ${resp.data}');

        List<Country> countries = parseCountries(resp.data);
        return countries;
      } else {
        log('Failed to listCountryHelper ${resp.message}');
        return false;
      }
    } catch (e) {
      log('Error during listCountryHelper: $e', error: e);
      return false;
    }
  }
  // Function to parse the XML response
  List<Country> parseCountries(String response) {
    final document = xml.XmlDocument.parse(response);
    final countryElements = document.findAllElements('Country');

    return countryElements.map((element) {
      return Country(
        code: element.findElements('Code').single.text,
        name: element.findElements('Name').single.text,
        shortName: element.findElements('ShortName').single.text,
      );
    }).toList();
  }
///end
}
