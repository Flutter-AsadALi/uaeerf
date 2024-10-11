import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../network_client/network_clients.dart';

import '../../utils/preference_labels.dart';
import '../controllers/app_preferences_controller/prefrences_controller.dart';
import '../controllers/internet_checker_controller/internet_checker_controller.dart';
import '../controllers/login_controller/auth_controller.dart';
import '../resources/session_controller/session_controller.dart';
import '../utils/app_consts.dart';

BindingsBuilder createBindings(BuildContext context) {
  return BindingsBuilder(() {
    /* -------------------------------------------------------------------------- */
    /*                                   NetworkClient                            */
    /* -------------------------------------------------------------------------- */
    Get.put<NetworkClient>(
      NetworkClient(AppConsts.baseUrl),
      permanent: true,  // permanent will ensure the instance is available throughout the app lifecycle
    );

    /* -------------------------------------------------------------------------- */
    /*                                   AuthController                           */
    /* -------------------------------------------------------------------------- */
    Get.put<AuthController>(
      AuthController(),
      permanent: true,
    );
    /* -------------------------------------------------------------------------- */
    /*                                   NoInternetController                     */
    /* -------------------------------------------------------------------------- */
    Get.put<InternetConnectionController>(
      InternetConnectionController(),
      permanent: true,
    );

    /* -------------------------------------------------------------------------- */
    /*                                   AuthController                           */
    /* -------------------------------------------------------------------------- */

  });
}
