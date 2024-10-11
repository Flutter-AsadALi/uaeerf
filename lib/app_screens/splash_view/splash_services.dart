import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';

import '../../controllers/app_preferences_controller/prefrences_controller.dart';
import '../../controllers/dashboard_controller/dashboard_controller.dart';
import '../../resources/session_controller/session_controller.dart';
import '../../utils/preference_labels.dart';
import '../dashboard_screens/dashboard_screens.dart';
import '../login_screens/login.dart';


class SplashServices {
  final DashboardControllers dashboardController = Get.put(DashboardControllers());
  void isSplashToLogin() async{
    Timer(const Duration(seconds: 0), () async {
      var authToken = await AppPreferencesController().getString(AppPreferencesLabels.authToken);
      log("authToken from splash prefs = $authToken");
      if (authToken.isEmpty || authToken == "1") {
        Get.offAll(() => const LoginScreen());
      } else {
        Get.offAll(() => const DashboardScreen());
      }
    });
  }
}
