// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class SessionController {
  static String selectedLanguageId = "en";
  static String authToken = "";
  static String randomCode = "";
  static bool isLogin = false;

  static final SessionController _session = SessionController._internel();

  static Color themeTextColor = const Color.fromRGBO(191,164,107, 1);
  static Color themeDarkColor = const Color.fromRGBO(191,164,107,1);
  static Color themeLightColor = const Color.fromRGBO(239,232,216,1);

  factory SessionController() {
    return _session;
  }

  SessionController._internel();
}
