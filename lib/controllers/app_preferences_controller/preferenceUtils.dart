// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_consts.dart';


class PreferenceUtils {
  static PreferenceUtils? _singleton;
  static SharedPreferences? _prefs;

  static Future<PreferenceUtils> getInstance() async {
    if (_singleton == null) {
      var singleton = PreferenceUtils._();
      await singleton._init();
      _singleton = singleton;
    }
    return _singleton!;
  }

  PreferenceUtils._();

  Future _init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  static String getUser() {
    return _prefs!.getString(AppConsts.apiData) ?? '';
  }
  static void saveUser(String user) {
    var prefs = _prefs;
    prefs?.setString(AppConsts.apiData, user);
  }
}
