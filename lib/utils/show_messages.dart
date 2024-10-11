import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

void showSuccessMessage(
  String message, {
  ScaffoldMessengerState? messengerState,
}) {
  //checkKey(message).then((value) {
  final s = messengerState ?? ScaffoldMessenger.of(Get.context!);
  s.showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTextStyle.boldWhite10,
      ),
      backgroundColor: AppColors.green,
    ),
  );
}

///
///
///
void showErrorMessage(
  String message, {
  ScaffoldMessengerState? messengerState,
}) {
  //checkKey(message);
  final s = messengerState ?? ScaffoldMessenger.of(Get.context!);
  s.showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTextStyle.boldWhite10,
      ),
      backgroundColor: AppColors.red,
    ),
  );
}

////
///
///
// showDialogMessage({
//   required BuildContext context,
//   required DialogType type,
//   required String message,
//   required String headingMessage,
//   required Function() okayBtn,
//   required Function() cancelBtn,
// }) {
//   AwesomeDialog(
//     context: context,
//     dialogType: type,
//     headerAnimationLoop: false,
//     animType: AnimType.bottomSlide,
//     title: headingMessage,
//     desc: message,
//     buttonsTextStyle: AppTextStyle.boldWhite12,
//     showCloseIcon: true,
//     btnCancelOnPress: () {
//       cancelBtn();
//     },
//     btnOkOnPress: () {
//       okayBtn();
//     },
//   ).show();
// }
