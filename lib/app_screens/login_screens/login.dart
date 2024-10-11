import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/login_controller/auth_controller.dart';
import '../../generated/assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';
import '../../utils/custom_drop_down.dart';
import '../../utils/loading_indicator.dart';
import '../../utils/primary_button.dart';
import '../../utils/show_messages.dart';
import '../../widgets/primary_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  AuthController authController = Get.put(AuthController());
  final TextEditingController forgotPinController = TextEditingController();

  @override
  void initState() {

    super.initState();
  }



  @override
  void dispose() {
    forgotPinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          body: authController.isLoading.value
              ? const Center(
                  child: LoadingIndicator(),
                )
              : SafeArea(
                  child: SizedBox(
                    height: 100.0.h,
                    width: 100.0.w,
                    child: ModalProgressHUD(
                      inAsyncCall: authController.isLoadingReload.value,
                      progressIndicator: const LoadingIndicator(),
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 2.h),
                          width: 100.w,
                          child: ListView(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 50.w,
                                    child: Text(
                                      "Create an Account",
                                      maxLines: 2,
                                      overflow:TextOverflow.ellipsis,
                                      style: AppTextStyle.boldThemeDark14,
                                    ),
                                  ),
                                  Image.asset(Assets.imagesLogoMain,width: 10.h,height: 10.h,)
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "Please fill out form below",
                                style: AppTextStyle.regularGrayLight12,
                              ),
                              Form(
                                key: authController.formKey,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 2.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      CustomDropDownField(
                                        heading: 'Type',
                                        hintText: 'Choose Type...',
                                        bkColor:
                                            AppColors.white.withOpacity(0.9),
                                        headingTextStyle:
                                            AppTextStyle.regularBlack12,
                                        controller: TextEditingController(),
                                        listString:
                                            authController.registrationTypeList,
                                        selectValue: 'selectRegistrationType',
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        "PERSONAL DETAILS",
                                        style: AppTextStyle.regularRed10,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      PrimaryTextField(
                                        headingTextStyle:
                                            AppTextStyle.regularBlack12,
                                        heading: "Your Name",
                                        borderColor: AppColors.themeLightColor,
                                        borderWidth: 0.1.w,
                                        iconVal: true,
                                        prefixIcon: Icon(
                                          Icons.group,
                                          color: AppColors.grayLight,
                                        ),
                                        controller:
                                            authController.firstNameController,
                                        hintText: "First Name...",
                                        bkColor:
                                            AppColors.white.withOpacity(0.9),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      PrimaryTextField(
                                        headingTextStyle:
                                            AppTextStyle.regularBlack12,
                                        heading: "",
                                        borderColor: AppColors.themeLightColor,
                                        borderWidth: 0.1.w,
                                        controller:
                                            authController.lastNameController,
                                        hintText: "Last Name...",
                                        iconVal: true,
                                        prefixIcon: Icon(
                                          Icons.group,
                                          color: AppColors.grayLight,
                                        ),
                                        bkColor:
                                            AppColors.white.withOpacity(0.9),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      PrimaryTextField(
                                        headingTextStyle:
                                            AppTextStyle.regularBlack12,
                                        heading: "Father Name",
                                        borderColor: AppColors.themeLightColor,
                                        borderWidth: 0.1.w,
                                        iconVal: true,
                                        prefixIcon: Icon(
                                          Icons.drive_file_rename_outline,
                                          color: AppColors.grayLight,
                                        ),
                                        controller:
                                            authController.fatherNameController,
                                        hintText: "Father Name",
                                        // labelsController.labelModel.data!.signInUpPage!.fullNameTextHint!,
                                        bkColor:
                                            AppColors.white.withOpacity(0.9),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await authController
                                              .selectDate(context, true).then((s) {
                                            print("s---------");
                                            print(s);
                                            if(s!=null){
                                              print("s---------1");
                                              print(s);
                                              authController.dobController.text = s.toString();
                                              authController.updated();
                                            }else{
                                              authController.dobController.text="";
                                            }
                                          });
                                        },
                                        child: PrimaryTextField(
                                          headingTextStyle:
                                              AppTextStyle.regularBlack12,
                                          heading: "Date of Birth",
                                          iconVal: true,
                                          prefixIcon: Icon(
                                            Icons.calendar_month,
                                            color: AppColors.grayLight,
                                          ),
                                          enable: false,
                                          borderColor:
                                              AppColors.themeLightColor,
                                          borderWidth: 0.1.w,
                                          controller:
                                              authController.dobController,
                                          hintText: "Date of Birth",
                                          bkColor:
                                              AppColors.white.withOpacity(0.9),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      PrimaryTextField(
                                        headingTextStyle: AppTextStyle.regularBlack12,
                                        heading: "Email",
                                        iconVal: true,
                                        onSubmitted: (val) async{
                                          if (authController.selectRegistrationType.trim() != "") {
                                            if (authController.emailController
                                                    .text.isEmpty ||
                                                !authController.validateEmail(
                                                    authController
                                                        .emailController
                                                        .text)) {
                                              authController
                                                  .emailController.text = "";
                                              showErrorMessage(
                                                  "Valid email is required.");
                                            } else {
                                              await authController.checkIfEmailAvailable();
                                            }
                                          }
                                        },
                                        onChangeVal: (val) {
                                          if (authController
                                                  .selectRegistrationType
                                                  .trim() ==
                                              "") {
                                            authController
                                                .emailController.text = "";
                                            showErrorMessage(
                                                "Select Registration Type First");
                                          }
                                        },
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: AppColors.grayLight,
                                        ),
                                        borderColor: AppColors.themeLightColor,
                                        borderWidth: 0.1.w,
                                        controller:
                                            authController.emailController,
                                        hintText: "abc@gmail.com",
                                        bkColor:
                                            AppColors.white.withOpacity(0.9),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      PrimaryTextField(
                                        headingTextStyle:
                                            AppTextStyle.regularBlack12,
                                        heading: "Phone Number",
                                        iconVal: true,
                                        onSubmitted: (val)async {
                                          if (authController.selectRegistrationType.trim() != "") {
                                            await authController.checkIfMobileNoAvailable();
                                          }
                                        },
                                        onChangeVal: (val){
                                          if (authController.selectRegistrationType.trim() == "") {
                                              authController.phoneNumberController.text= "";
                                            showErrorMessage("Select Registration Type First");
                                          }
                                        },
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color: AppColors.grayLight,
                                        ),
                                        borderColor: AppColors.themeLightColor,
                                        borderWidth: 0.1.w,
                                        controller: authController
                                            .phoneNumberController,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[0-9]")),
                                          LengthLimitingTextInputFormatter(13),
                                        ],
                                        keyboardType: TextInputType.number,
                                        hintText: "00971561234567",
                                        bkColor:
                                            AppColors.white.withOpacity(0.9),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 2.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(0.2.h),
                                            border: Border.all(
                                                color: AppColors.grayLight)),
                                        child: Column(
                                          children: [
                                            PrimaryTextField(
                                              heading: "Emirates ID*",
                                              headingTextStyle:
                                                  AppTextStyle.regularBlack12,
                                              controller: authController
                                                  .eIdNumberController,
                                              hintText: "123-1234-1234567-1",
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    18),
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                                CustomInputFormatter(),
                                              ],
                                              prefixIcon: Icon(
                                                PhosphorIcons
                                                    .identification_card,
                                                size: 3.h,
                                                color: AppColors.grayLight,
                                              ),
                                              iconVal: true,
                                              bkColor: AppColors.white
                                                  .withOpacity(0.9),
                                            ),
                                            SizedBox(
                                              height: 2.0.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                authController
                                                    .selectDate(context, false)
                                                    .then((s) {

                                                  if(s!=null){
                                                    print("s---------1");
                                                    print(s);
                                                    authController.expireDateController.text = s.toString();
                                                    authController.updated();
                                                  }else{
                                                    authController.expireDateController.text="";
                                                  }
                                                });
                                              },
                                              child: PrimaryTextField(
                                                headingTextStyle:
                                                    AppTextStyle.regularBlack12,
                                                heading: "Expire Date",
                                                controller: authController
                                                    .expireDateController,
                                                hintText:
                                                    "Enter Emirates ExpireDate",
                                                prefixIcon: Icon(
                                                  PhosphorIcons.calendar,
                                                  size: 3.h,
                                                  color: AppColors.grayLight,
                                                ),
                                                enable: false,
                                                iconVal: true,
                                                bkColor: AppColors.white
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      PrimaryTextField(
                                        headingTextStyle:
                                            AppTextStyle.regularBlack12,
                                        heading: "Weight",
                                        iconVal: true,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[0-9]")),
                                          LengthLimitingTextInputFormatter(3),
                                        ],
                                        prefixIcon: Icon(
                                          Icons.monitor_weight_outlined,
                                          color: AppColors.grayLight,
                                        ),
                                        borderColor: AppColors.themeLightColor,
                                        borderWidth: 0.1.w,
                                        controller:
                                            authController.weightController,
                                        hintText: "66 kg",
                                        bkColor:
                                            AppColors.white.withOpacity(0.9),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      PrimaryTextField(
                                        headingTextStyle:
                                            AppTextStyle.regularBlack12,
                                        heading: "Location",
                                        iconVal: true,
                                        prefixIcon: Icon(
                                          Icons.pin_drop_outlined,
                                          color: AppColors.grayLight,
                                        ),
                                        borderColor: AppColors.themeLightColor,
                                        borderWidth: 0.1.w,
                                        controller:
                                            authController.addressController,
                                        hintText: "Address",
                                        bkColor:
                                            AppColors.white.withOpacity(0.9),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      CustomDropDownField(
                                        heading: 'Select Country',
                                        hintText: 'Choose Country...',
                                        bkColor:
                                            AppColors.white.withOpacity(0.9),
                                        headingTextStyle:
                                            AppTextStyle.regularBlack12,
                                        controller: TextEditingController(),
                                        listString: authController.countryList,
                                        selectValue: 'selectedCountry',
                                        onChanged: (value) {},
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      CustomDropDownField(
                                        heading: 'Select City',
                                        hintText: 'Choose City...',
                                        bkColor:
                                            AppColors.white.withOpacity(0.9),
                                        headingTextStyle:
                                            AppTextStyle.regularBlack12,
                                        controller: TextEditingController(),
                                        listString: authController.cityList,
                                        selectValue: 'selectedCity',
                                        onChanged: (value) {},
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      CustomDropDownField(
                                        heading: 'Select Gender',
                                        hintText: 'Choose Gender...',
                                        bkColor:
                                            AppColors.white.withOpacity(0.9),
                                        headingTextStyle:
                                            AppTextStyle.regularBlack12,
                                        controller: TextEditingController(),
                                        listString: authController.genderList,
                                        selectValue: 'selectedGender',
                                        onChanged: (value) {},
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
          bottomNavigationBar: Obx(() {
            return authController.isLoading.value
                ? SizedBox()
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.h),
                      border: Border.all(color: AppColors.grey, width: 0.1.h),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryButton(
                          title: "Submit",
                          onPressed: () {
                            authController.validateFields();
                          },
                          isIcon: false,
                          textStyle: AppTextStyle.boldWhite12,
                          width: 70.w,
                          height: 5.h,
                          backgroundColor: AppColors.themeDarkColor,
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 2.h),
                        )
                      ],
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
/*Center(
                                  child: PrimaryButton(
                                    title: "login",
                                    // labelsController
                                    //     .labelModel
                                    //     .data!
                                    //     .pageLogin!
                                    //     .loginButton!,
                                    isIcon: true,
                                    icon: Icon(
                                      PhosphorIcons.sign_in,
                                      size: 3.h,
                                      color: AppColors.white,
                                    ),
                                    titleColor: AppColors.white,
                                    textStyle: AppTextStyle.boldWhite13,
                                    width: 70.w,
                                    backgroundColor: AppColors.green,
                                    height: screenSize.height > 680? 6.h : 9.h,

                                    onPressed: () {
                                      authController.submitPersonNewRegistration();



                                    },
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.h),
                                  ),
                                ),
                                  Center(
                                  child: PrimaryButton(
                                    title: "register",
                                    // labelsController
                                    //     .labelModel
                                    //     .data!
                                    //     .pageLogin!
                                    //     .loginButton!,
                                    isIcon: true,
                                    icon: Icon(
                                      PhosphorIcons.sign_in,
                                      size: 3.h,
                                      color: AppColors.white,
                                    ),
                                    titleColor: AppColors.white,
                                    textStyle: AppTextStyle.boldWhite13,
                                    width: 70.w,
                                    backgroundColor: AppColors.green,
                                    height: screenSize.height > 680? 6.h : 9.h,

                                    onPressed: () {
                                      // authController.performRegistration();
                                    },
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.h),
                                  ),
                                ),*/