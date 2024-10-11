import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../controllers/login_controller/auth_controller.dart';
import 'app_text_style.dart';

class CustomDropDownField extends StatelessWidget {
  final String heading;
  final String hintText;
  final Color bkColor;
  final TextEditingController controller;
  final List<String> listString;
  final String? selectValue;
  final Function(String?)? onChanged;
  final TextStyle headingTextStyle;
  const CustomDropDownField({
    super.key,
    required this.heading,
    required this.hintText,
    required this.bkColor,
    required this.headingTextStyle,
    required this.controller,
    required this.listString,
    required this.selectValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    String? valueStore;
    AuthController authController=Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heading.isNotEmpty)
          Text(
            heading,
            style: headingTextStyle,
          ),
        if (heading.isNotEmpty)
          SizedBox(
            height: 1.h,
          ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.h)
,          decoration: BoxDecoration(
            color: bkColor,
            borderRadius: BorderRadius.circular(10), // Replace with 1.h if needed
          ),
          child: Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: hintText != "null"
                    ? Text(
                  hintText,
                  style:AppTextStyle.regularGrey12,
                )
                    : const SizedBox(),
                items: listString.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: AppTextStyle.regularGrey12,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (selectValue == "selectedGender") {
                    authController.selectGender = value.toString();
                    valueStore = authController.selectGender;
                    int index = authController.gendersModel.indexWhere((item) => item.name ==valueStore);
                    authController.selectGenderID=authController.gendersModel[index].code;
                    authController.updated();
                  } else if (selectValue == "selectedCity") {
                    authController.selectCity = value.toString();
                    valueStore = authController.selectCity ;
                    int index = authController.cityModel.indexWhere((item) => item.name ==valueStore);
                    authController.selectCityID=authController.cityModel[index].code;
                    authController.updated();
                  } else if (selectValue == "selectedCountry") {
                    authController.selectCountry = value.toString();
                    valueStore = authController.selectCountry ;
                    int index = authController.countryModel.indexWhere((item) => item.name ==valueStore);
                    authController.selectCountryID=authController.countryModel[index].code;
                    authController.updated();
                  }else if (selectValue == "selectRegistrationType") {
                    authController.selectRegistrationType = value.toString();
                    valueStore = authController.selectRegistrationType ;
                    int index = authController.registrationType.indexWhere((item) => item.name ==valueStore);
                    authController.selectRegistrationTypeID=authController.registrationType[index].code;
                    authController.updated();
                  }
                  // onChanged?.call(value); // Trigger the passed onChanged callback
                },
               value: selectValue == "selectedGender" && listString.contains(authController.selectGender)
                    ? authController.selectGender
                    :selectValue == "selectRegistrationType" && listString.contains(authController.selectRegistrationType)
                    ? authController.selectRegistrationType
                    : selectValue == "selectedCity" && listString.contains(authController.selectCity)
                    ? authController.selectCity
                    : selectValue == "selectedCountry" && listString.contains(authController.selectCountry)
                    ? authController.selectCountry
                    : null,
                itemHeight: 5.h,
                dropdownMaxHeight: 30.h,
                searchController: controller,
                searchInnerWidgetHeight: 20.h,
                searchInnerWidget: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
                  child: TextFormField(
                    controller: controller,
                    textAlign: TextAlign.start,
                    style: AppTextStyle.regularBlack12,
                    cursorColor: Colors.black, // Replace with AppColors.white
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h), // Replace with 1.h if needed
                      hintText: "Search....",
                      hintStyle: AppTextStyle.regularGrey12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(1.h)),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (DropdownMenuItem item, String searchValue) {
                  return item.value!.toString().toLowerCase().contains(searchValue.toLowerCase());
                },
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    controller.clear();
                  }
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
