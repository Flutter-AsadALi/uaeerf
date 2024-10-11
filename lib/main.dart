// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:uaeerf_app/resources/routes/app_routes.dart';
import 'package:uaeerf_app/resources/session_controller/session_controller.dart';
import 'package:uaeerf_app/utils/app_colors.dart';
import 'binding/initial_binding.dart';
import 'controllers/notification_controller/notification_controller.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   if (message.data["taskid"] != "") {
//     NotificationSetup().speak(message.notification!.title!);
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // AppPreferencesController().clearEcryptedPrefs();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // NotificationSetup().initNotification();
    // NotificationSetup().firebaseNotification();
    // NotificationSetup().requestPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
/* -------------------------------------------------------------------------- */
/*                             DeviceOrientation                              */
/* -------------------------------------------------------------------------- */
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: createBindings(context),
        theme: ThemeData(
          primaryColor: SessionController.themeDarkColor,
          backgroundColor: AppColors.themeLightColorTwo,
          scaffoldBackgroundColor: AppColors.themeLightColor,
        ),
        // theme: ThemeData.dark(),
        getPages: AppRoutes.appRoutes(),
      );
    });
  }
}
