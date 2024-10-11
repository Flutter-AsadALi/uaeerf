import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/login_controller/auth_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

// ignore: must_be_immutable
class PrimaryTextField extends StatelessWidget {
  PrimaryTextField(
      {super.key,
      this.heading = "",
      required this.controller,
      required this.hintText,
      this.enable = true,
      this.iconVal = false,
      this.iconSuffix = false,
      required this.bkColor,
        this.borderColor,
      required this.headingTextStyle,
      this.borderWidth,
      this.readVal = false,
      this.keyboardType,
        this.maxLine,
        this.onChangeVal,
        this.onSubmitted,
      this.inputFormatters,
      this.prefixIcon,
      this.suffixIcon
      });

  final String heading;
  final TextEditingController controller;
  final String hintText;
  final bool enable;
  Color? borderColor;
  double? borderWidth;
  Color bkColor;
  int? maxLine;
  final TextStyle headingTextStyle;
  final bool readVal;
  final bool iconVal;
  final bool iconSuffix;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChangeVal;
  final void Function(String)? onSubmitted;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {
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
            height: 1.0.h,
          ),
        ClipRRect(
          child: Container(
            decoration: BoxDecoration(
                color: bkColor,
              borderRadius: BorderRadius.circular(1.h),
              border: Border.all(
                color:AppColors.grayLight, // Same color for all borders
                width: 0.5.w,
              ),
            ),
            child: Center(
              child: TextField(
                autocorrect: true,
                controller: controller,
                enabled: enable,
                textAlign: TextAlign.start,
                style: AppTextStyle.regularBlack12,
                keyboardType: keyboardType,
                inputFormatters: inputFormatters,
                cursorColor: AppColors.black,
                onSubmitted:onSubmitted,
                onChanged: onChangeVal,
                autofocus:false,
                decoration: InputDecoration(
                  prefixIcon: iconVal ? prefixIcon : const SizedBox(),
                  suffix:  iconSuffix ? suffixIcon : const SizedBox(),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.5.h),
                  hintStyle: AppTextStyle.regularGrey12,
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    if (text.length > 15) {
      return oldValue;
    }

    String newText = '';
    for (int i = 0; i < text.length; i++) {
      if (i == 3 || i == 7 || i == 14) {
        newText += '-';
      }
      newText += text[i];
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}



class SimpleTextField extends StatelessWidget {
  const SimpleTextField(
      {Key? key,
      this.heading = "",
      required this.controller,
      required this.hintText,
      this.enable = true,
      required this.lines})
      : super(key: key);
  final String heading;
  final TextEditingController controller;
  final String hintText;
  final bool enable;
  final int lines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heading.isNotEmpty)
          Text(
            heading,
            style: AppTextStyle.boldBlack10,
          ),
        if (heading.isNotEmpty)
          SizedBox(
            height: 1.0.h,
          ),
        Container(
          // height: 6.0.h,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(1.h),
              border: Border.all(color: AppColors.blackLight)),

          child: Center(
            child: TextField(
              maxLines: lines,
              enabled: enable,
              controller: controller,
              //obscureText: !authController.isVisible.value,
              cursorColor: AppColors.black,
              textAlign: TextAlign.start,
              style: AppTextStyle.regularBlack10,

              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.5.h),
                hintStyle: AppTextStyle.regularGrey10,
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    this.heading = "",
    required this.controller,
    required this.hintText,
  }) : super(key: key);
  final String heading;
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (heading.isNotEmpty)
            Text(
              heading,
              style: AppTextStyle.boldBlack10,
            ),
          if (heading.isNotEmpty)
            SizedBox(
              height: 1.0.h,
            ),
          Container(
            // height: 6.0.h,
            decoration: BoxDecoration(
                color: Color.fromARGB(73, 74, 75, 1),
                borderRadius: BorderRadius.circular(1.h),
                border: Border.all(color: AppColors.blackLight)),
            child: Center(
              child: TextField(
                autocorrect: true,
                controller: controller,
                obscureText: !authController.isVisible.value,
                textAlign: TextAlign.start,
                style: AppTextStyle.regularWhite12,
                cursorColor: AppColors.white,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    PhosphorIcons.lock_key,
                    size: 3.h,
                    color: AppColors.white,
                  ),
                  // contentPadding:
                  // EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.5.h),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.5.h),

                  suffix: InkWell(
                    onTap: () {
                      authController.isVisible.value =
                          !authController.isVisible.value;
                    },
                    child: Icon(
                      authController.isVisible.value
                          ? PhosphorIcons.eye
                          : PhosphorIcons.eye_slash,
                      size: 2.0.h,
                      color: authController.isVisible.value
                          ? AppColors.white
                          : AppColors.white,
                    ),
                  ),
                  hintStyle: AppTextStyle.regularWhite12,
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

// ignore: must_be_immutable
class PrimaryTextWithCameraField extends StatelessWidget {
  PrimaryTextWithCameraField({
    super.key,
    this.heading = "",
    required this.controller,
    required this.hintText,
    this.enable = true,
    required this.bkColor,
    this.readVal = false,
    this.keyboardType,
    this.inputFormatters,
  });
  final String heading;
  final TextEditingController controller;
  final String hintText;
  final bool enable;
  Color bkColor;
  final bool readVal;
  final TextInputType? keyboardType;
  final List<FilteringTextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (heading.isNotEmpty)
            Text(
              heading,
              style: AppTextStyle.boldBlack10,
            ),
          if (heading.isNotEmpty)
            SizedBox(
              height: 1.0.h,
            ),
          Container(
            // height: 6.0.h,
            decoration: BoxDecoration(
              color: bkColor,
              borderRadius: BorderRadius.circular(1.h),
            ),
            child: Center(
              child: TextField(
                autocorrect: true,
                controller: controller,
                enabled: enable,
                textAlign: TextAlign.start,
                style: AppTextStyle.regularGrey10,
                keyboardType: keyboardType,
                inputFormatters: inputFormatters,
                cursorColor: AppColors.black,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.5.h),
                  hintStyle: AppTextStyle.regularGrey10,
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectTextField extends StatelessWidget {
  const SelectTextField({
    super.key,
    this.heading = "",
    required this.controller,
    required this.hintText,
    this.enable = true,
  });
  final String heading;
  final TextEditingController controller;
  final String hintText;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    bool listOpen = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heading.isNotEmpty)
          Text(
            heading,
            style: AppTextStyle.boldBlack10,
          ),
        if (heading.isNotEmpty)
          SizedBox(
            height: 1.0.h,
          ),
        Container(
          // height: 6.0.h,
          decoration: BoxDecoration(
            //color: AppColors.paleGrey,
            borderRadius: BorderRadius.circular(1.h),
          ),
          child: Center(
            child: listOpen == false
                ? TextField(
                    autocorrect: true,
                    controller: controller,
                    enabled: enable,
                    readOnly: true,
                    textAlign: TextAlign.start,
                    style: AppTextStyle.regularGrey10,
                    cursorColor: AppColors.black,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 2.h, vertical: 1.5.h),
                      suffixIcon: IconButton(
                        onPressed: () {
                          log("tap1");
                        },
                        icon: Icon(
                          PhosphorIcons.caret_down_bold,
                          size: 2.5.h,
                          color: AppColors.black,
                        ),
                      ),
                      hintStyle: AppTextStyle.regularGrey10,
                      hintText: hintText,
                      border: InputBorder.none,
                    ),
                  )
                : Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.paleGrey,
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                  ),
          ),
        ),
      ],
    );
  }






}
