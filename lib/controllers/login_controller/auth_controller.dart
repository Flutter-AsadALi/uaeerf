import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../app_helper/auth_helper.dart';
import '../../model/listing_model/PersonRegistrationResultModel.dart';
import '../../model/listing_model/city_list_model.dart';
import '../../model/listing_model/country_list_model.dart';
import '../../model/listing_model/email_check_model.dart';
import '../../model/listing_model/gender_list_model.dart';
import '../../model/listing_model/registration_list_model.dart';
import '../../model/login_model/login_response_model.dart';
import '../../network_client/network_clients.dart';
import '../../utils/show_messages.dart';

class AuthController extends GetxController {
  late AuthHelper _authHelper;
  final formKey = GlobalKey<FormState>();
  late LoginResponseModel loginResponse;
  late PersonRegistrationResult personRegistrationResult;
  RxBool isLoading = false.obs;
  bool isCheckValue = false;
  RxBool isVisible = false.obs;
  RxBool isLoadingSignUp = false.obs;
  RxBool isLoadingReload = false.obs;
  late List<City> cityModel;
  List<String> cityList = [];
  late List<Country> countryModel;
  late EmailAvailabilityModel emailAvailabilityModel;
  late PhoneAvailabilityModel phoneAvailabilityModel;
  List<String> countryList = [];
  late List<Gender> gendersModel;
  List<String> genderList = [];
  late List<RegistrationType> registrationType;
  List<String> registrationTypeList = [];
  String selectGender = "";
  String selectGenderID = "";
  String selectCity = "";
  String selectCityID = "";
  String selectCountry = "";
  String selectCountryID = "";
  String selectRegistrationType = "";
  String selectRegistrationTypeID = "";
  final TextEditingController genController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController eIdNumberController = TextEditingController();
  final TextEditingController expireDateController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void onInit() {
    _authHelper = AuthHelper(Get.find<NetworkClient>());
    getInitData();
    super.onInit();
  }

  bool _validateEmail(String email) {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    return RegExp(emailPattern).hasMatch(email);
  }

  // Function to format DateTime as a string in 'yyyy-MM-dd'
  String formatDateForAPI(String dateTime) {
    // Format the DateTime to 'yyyy-MM-dd'
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    DateTime dateTimeNew = DateTime.parse(dateTime);
    return formatter.format(dateTimeNew);
  }

  getInitData() async {
    try {
      isLoading.value = true;
      getCityList();
      getCountryList();
      getGenderList();
      getRegistrationType();
      isLoading.value = false;
    } catch (e) {
      log("error $e");
    }
  }

  updated() {
    isLoading.value = true;
    isLoading.value = false;
  }

   validateFields() async{
    // Dropdown validations
    if (selectRegistrationType.isEmpty) {
      showErrorMessage("Registration type is required.");
      return false;
    }
    if (firstNameController.text.isEmpty) {
      showErrorMessage("First name is required.");
      return false;
    }
    if (lastNameController.text.isEmpty) {
      showErrorMessage("Last name is required.");
      return false;
    }
    if (fatherNameController.text.isEmpty) {
      showErrorMessage("Father name is required.");
      return false;
    }
    if (dobController.text.isEmpty) {
      showErrorMessage("DOB date is required.");
      return false;
    }

    if (emailController.text.isEmpty || !validateEmail(emailController.text)) {
      showErrorMessage("Valid email is required.");
      return false;
    }else{
      bool val= await checkIfEmailAvailable();
      if(val==false){
        return false;
      }
    }

    if (phoneNumberController.text.isEmpty || !validatePhoneNumber(phoneNumberController.text)) {
      showErrorMessage("Valid phone number is required (e.g. 971562236773).");
      return false;
    }else {
      bool val=await checkIfMobileNoAvailable();
      if(val==false){
        return false;
      }
    }
    if (eIdNumberController.text.isEmpty ||
        !validateEID(eIdNumberController.text)) {
      showErrorMessage("Valid EID is required (e.g. 123-1234-1234567-1).");
      return false;
    }
    if (expireDateController.text.isEmpty) {
      showErrorMessage("Expiration date is required.");
      return false;
    }
    if (weightController.text.isEmpty) {
      showErrorMessage("Weight is required.");
      return false;
    }
    if (addressController.text.isEmpty) {
      showErrorMessage("Address is required.");
      return false;
    }
    if (selectCountry.isEmpty) {
      showErrorMessage("Country is required.");
      return false;
    }
    if (selectCity.isEmpty) {
      showErrorMessage("City is required.");
      return false;
    }
    if (selectGender.isEmpty) {
      showErrorMessage("Gender is required.");
      return false;
    }

    // If all validations pass
    submitPersonNewRegistration();
    return true;
  }

// Helper functions for validation
  bool validateEmail(String email) {
    // Basic email pattern for validation
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  bool validatePhoneNumber(String phone) {
    // Phone number pattern: must start with 971 and follow with 9 digits
    String pattern = r'^971[0-9]{9}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(phone);
  }

  bool validateEID(String eid) {
    // EID pattern: 123-1234-1234567-1
    String pattern = r'^\d{3}-\d{4}-\d{7}-\d{1}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(eid);
  }

/* -------------------------------------------------------------------------- */
/*                               login Soap                                */
/* -------------------------------------------------------------------------- */
  submitPersonNewRegistration() async {
    String soapAction = "http://ws.uaeerf.ae/Submit_PersonNewRegistration";
    isLoading.value = true;
    var res = loginSoap();
    if (res) {
      var dob = formatDateForAPI(dobController.text);
      var nowDate = formatDateForAPI(DateTime.now().toString());
      print("nowDate");
      print(nowDate);
      var name = "${firstNameController.text} ${lastNameController.text}";
      var response = await _authHelper.registerNewUserHelper(
        soapAction: soapAction,
        personType: int.parse(selectRegistrationTypeID),
        formId: 1,
        userId: 6422,
        name: name,
        fatherName: fatherNameController.text,
        country: selectCountry,
        countryId: selectCountryID,
        nationality: selectCountry,
        nationalityId: selectCountryID,
        dob: dob,
        sex: selectGender,
        sexId: selectGenderID,
        address: addressController.text,
        poBox: '111311',
        city: selectCity,
        cityId: selectCityID,
        mobile: phoneNumberController.text,
        email: emailController.text,
        registrationType: 'Full',
        dateSubmit: nowDate,
        status: 'Approved',
        statusId: 1,
        seasonCode: 2024,
        documentCheck: 1,
        weight: weightController.text,
        eid: eIdNumberController.text,
        sourceId: 1,
      );
      print(response);

      if (response == true) {
        personRegistrationResult = response;
        if (personRegistrationResult.isRegistrationSuccessful == true) {
          showSuccessMessage("Register Done");
          clearAllData();
          updated();
          isLoading.value = false;
        }
      }
    }
  }

  void clearAllData() {
    // Clearing TextEditingControllers
    genController.clear();
    emailController.clear();
    phoneNumberController.clear();
    eIdNumberController.clear();
    expireDateController.clear();
    dobController.clear();
    nationalityController.clear();
    firstNameController.clear();
    lastNameController.clear();
    fatherNameController.clear();
    weightController.clear();
    addressController.clear();

    // Resetting selected dropdown values
    selectGender = "";
    selectGenderID = "";
    selectCity = "";
    selectCityID = "";
    selectCountry = "";
    selectCountryID = "";
    selectRegistrationType = "";
    selectRegistrationTypeID = "";
  }

/* -------------------------------------------------------------------------- */
/*                               login Soap                                */
/* -------------------------------------------------------------------------- */
  loginSoap() async {
    String soapAction = "http://emiratesequestrian.info/Login";
    var response = await _authHelper.login(
        soapAction: soapAction, userName: "WS_TEST", password: "TEST@0123");
    if (response == true) {
      return true;
    } else {
      return false;
    }
  }

/* -------------------------------------------------------------------------- */
/*                               get city list                                */
/* -------------------------------------------------------------------------- */
  getCityList() async {
    String soapAction = "http://emiratesequestrian.info/getCityList";
    var response = await _authHelper.cityListHelper(soapAction: soapAction);
    if (response != false) {
      print("response====getCityList");
      print(response);
      cityModel = response;
      cityModel.forEach((element) {
        cityList.add(element.name);
      });
      print("cityList.length");
      print(cityList.length);
    }
  }

  /* -------------------------------------------------------------------------- */
/*                               get getCountryList                             */
/* -------------------------------------------------------------------------- */
  getCountryList() async {
    String soapAction = "http://emiratesequestrian.info/getCountryList";
    var response = await _authHelper.listCountryHelper(soapAction: soapAction);
    if (response != false) {
      print("response====getCountryList");
      print(response);
      countryModel = response;
      countryModel.forEach((element) {
        countryList.add(element.name);
      });
    }
  }
  /* -------------------------------------------------------------------------- */
/*                               get getGenderList                              */
/* -------------------------------------------------------------------------- */
  getGenderList() async {
    String soapAction = "http://emiratesequestrian.info/getGenderList";
    var response = await _authHelper.listGenderHelper(soapAction: soapAction);
    if (response != false) {
      print("response====getGenderList");
      print(response);
      gendersModel = response;
      gendersModel.forEach((element) {
        genderList.add(element.name);
      });
    }
  }

  /* -------------------------------------------------------------------------- */
/*                               get getRegistrationType                              */
/* -------------------------------------------------------------------------- */
  getRegistrationType() async {
    String soapAction = "http://emiratesequestrian.info/getRegistrationType";
    var response =
        await _authHelper.lisRegistrationTypeHelper(soapAction: soapAction);
    if (response != false) {
      print("response====getGenderList");
      print(response);
      registrationType = response;
      registrationType.forEach((element) {
        registrationTypeList.add(element.name);
      });
    }
  }

/* -------------------------------------------------------------------------- */
/*                               checkIfEmailAvailable                        */
/* -------------------------------------------------------------------------- */
  checkIfEmailAvailable() async {
    String soapAction = "http://emiratesequestrian.info/CheckIfEmailAvailable";
    var response = await _authHelper.checkEmailHelper(
        soapAction: soapAction,
        eMailAdd: emailController.text,
        personID: 123,
        regTypeID: int.parse(selectRegistrationTypeID));
    if (response != false) {
      print("response====controller");
      print(response);
      emailAvailabilityModel = response;
      if (emailAvailabilityModel.isEmailAvailable != true) {
        emailController.text = "";
        showErrorMessage("This Email is Already used");
      }else{
        return false;
      }
    }
  }
  /* -------------------------------------------------------------------------- */
/*                               checkIfMobileNoAvailable                        */
/* -------------------------------------------------------------------------- */
  checkIfMobileNoAvailable() async {
    String soapAction =
        "http://emiratesequestrian.info/CheckIfMobileNoAvailable";
    var response = await _authHelper.checkPhoneHelper(
        soapAction: soapAction,
        personID: 123,
        regTypeID: int.parse(selectRegistrationTypeID),
        mobileNo: phoneNumberController.text);
    if (response != false) {
      print("response====controller");
      print(response);
      phoneAvailabilityModel = response;
      if (phoneAvailabilityModel.isMobileAvailable != true) {
        phoneNumberController.text = "";
        showErrorMessage("This Phone Number is Already used");
      }else{
        return false;
      }
    }
  }

  selectDate(BuildContext context, bool isDob) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = isDob
        ? await showDatePicker(
            context: context,
            firstDate: DateTime(1880), // Setting the first date to 1880
            lastDate: now,
          )
        : await showDatePicker(
            context: context,
            initialDate: now.add(Duration(days: 1)),
            firstDate: now.add(Duration(days: 1)),
            lastDate: DateTime(2100),
            selectableDayPredicate: (DateTime date) {
              return date.isAfter(now); // Disable current and past dates
            },
          );
    if (picked != null) {
      var s = DateFormat('yyyy-MM-dd').format(picked);
      return s;
    }
  }
}
