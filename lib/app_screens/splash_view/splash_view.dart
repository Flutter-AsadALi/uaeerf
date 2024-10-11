
import 'package:flutter/material.dart';
import 'package:uaeerf_app/app_screens/splash_view/splash_services.dart';
import '../../controllers/app_preferences_controller/prefrences_controller.dart';
import '../../generated/assets.dart';
import '../../resources/session_controller/session_controller.dart';
import '../../utils/preference_labels.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  String authToken = "";
  String setLangId = "";

  @override
  void initState() {
    getPrefsData();
    super.initState();
  }

  ///
  ///
  ///
  void getPrefsData() async {
    setLangId =
    await AppPreferencesController().getString(AppPreferencesLabels.langId);
    if (setLangId.isEmpty) {
      SessionController.selectedLanguageId = "en";
      await AppPreferencesController().setString(
        AppPreferencesLabels.langId,
        SessionController.selectedLanguageId,
      );
      splashServices.isSplashToLogin();

    } else {
      setLangId = await AppPreferencesController().getString(AppPreferencesLabels.langId);
      SessionController.selectedLanguageId = setLangId;
      splashServices.isSplashToLogin();

    }
    ///
    ///
    ///
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        Image.asset(Assets.iconsAppLogo,height: 20.h,width: 20.h,)
        ),
      );
  }
}
