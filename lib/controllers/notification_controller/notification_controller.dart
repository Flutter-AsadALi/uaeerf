// import 'dart:developer';
// import 'dart:io';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// // import 'package:flutter_tts/flutter_tts.dart';
// import 'package:get/get.dart';
//
// import '../../resources/session_controller/session_controller.dart';
// import '../../utils/preference_labels.dart';
// import '../app_preferences_controller/prefrences_controller.dart';
//
// class NotificationSetup {
//
//   Future<void> initNotification() async {
//
//     var initializationSettingsAndroid =  const AndroidInitializationSettings("app_icon");
//     var initializationSettingsIOS = const DarwinInitializationSettings(
//       requestAlertPermission: false,
//       requestBadgePermission: false,
//       requestSoundPermission: false,
//     );
//     var initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS,);
//     await FlutterLocalNotificationsPlugin().initialize(
//       initializationSettings,
//       // onSelectNotification: (payload) async {
//       //   return;
//       // },
//     );
//   }
//
//   void firebaseNotification() {
//     //////////////////////////////////////////////////////////////////////////
//     ///  This method call when app in terminated state and you get a notification
//     //////////////////////////////////////////////////////////////////////////
//     FirebaseMessaging.instance.getInitialMessage().then(
//       (message) async {
//         log("FirebaseMessaging.onMessageOpenedApp.listen");
//         RemoteNotification? notification = message?.notification;
//         if (notification != null) {
//           Map data = message!.data;
//           print("===================msg================");
//           print(data.toString());
//           print(data["taskid"].toString());
//           if (data["taskid"] != "") {
//           } else {
//             String authToken = await AppPreferencesController().getString(AppPreferencesLabels.authToken);
//             if (authToken.isEmpty || authToken == "1") {
//               log("authToken is empty");
//               // Get.offAll(() => const SplashScreen());
//             } else {
//               log("authToken is not  empty");
//               if (message.notification != null) {
//                 // if (message.data["notification_type"] == "1") {
//                 //   dashboardController
//                 //       .getDashboardData()
//                 //       .then((value) => Get.offAll(() => const SplashScreen()));
//                 // } else if (message.data["notification_type"] == "2") {
//                 //   Get.offAll(() => const NotificationScreens());
//                 // }
//               }
//             }
//           }
//         }
//       },
//     );
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message)async {
//       RemoteNotification? notification = message.notification;
//       if (notification != null) {
//         Map data = message.data;
//
//           _showNotification(
//             notification.title!,
//             notification.body!,
//             message.data['voiceEnabled'].toString(),
//           );
//
//       }
//     });
//
//     // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//     //   RemoteNotification? notification = message.notification;
//
//     //   if (notification != null) {
//     //     Map data = message.data;
//     //     log(data.toString());
//     //     log(data["message_notification"]);
//
//     //     _showNotification(
//     //       notification.title!,
//     //       notification.body!,
//     //       message.data['voiceEnabled'].toString(),
//     //     );
//     //   }
//
//     // if (notification != null) {
//     //   Map data = message.data;
//     //   log("used");
//     //   log(data.toString());
//     //   if (data["message_notification"] == "true") {
//     //   } else {
//     //    // final DashboardControllers dashboardController = Get.find();
//
//     //     String authToken = await AppPreferencesController()
//     //         .getString(AppPreferencesLabels.authToken);
//
//     //     if (authToken.isEmpty || authToken == "1") {
//     //       log("authToken is empty");
//     //       //Get.offAll(() => const SplashScreen());
//     //     } else {
//     //       log("authToken is not  empty");
//     //       _showNotification(
//     //         notification.title!,
//     //         notification.body!,
//     //         message.data['voiceEnabled'].toString(),
//     //       );
//     //       // if (message.notification != null) {
//     //       //   if (message.data["notification_type"] == "1") {
//     //       //     dashboardController
//     //       //         .getDashboardData()
//     //       //         .then((value) => Get.offAll(() => const SplashScreen()));
//     //       //   } else if (message.data["notification_type"] == "2") {
//     //       //     Get.offAll(() => const NotificationScreens());
//     //       //   }
//     //       // }
//     //     }
//
//     //   }
//     // }
//     // });
//
//     ////////////////////////////////////////////////////////////////////////////
//     // 3. This method only call when App in background and not terminated(not closed)
//     ////////////////////////////////////////////////////////////////////////////
//     FirebaseMessaging.onMessageOpenedApp.listen(
//       (RemoteMessage message) async {
//         /* -------------------------------------------------------------------------- */
//         /*                            navigate accordingly                            */
//         /* -------------------------------------------------------------------------- */
//
//         log("FirebaseMessaging.onMessageOpenedApp.listen");
//         RemoteNotification? notification = message.notification;
//         log("background");
//         if (notification != null) {
//           Map data = message.data;
//
//           log("data.toString()");
//           log(data.toString());
//           if (data["message_notification"] == "true") {
//           } else {
//             // final DashboardControllers dashboardController = Get.find();
//
//             String authToken = await AppPreferencesController()
//                 .getString(AppPreferencesLabels.authToken);
//             log("background");
//             if (authToken == "1") {
//               log("authToken is empty");
//               // Get.offAll(() => const SplashScreen());
//             } else {
//               log("authToken is not  empty");
//               if (message.notification != null) {
//                 if (message.data["notification_type"] == "1") {
//                   // dashboardController
//                   //     .getDashboardData()
//                   //     .then((value) => Get.offAll(() => const SplashScreen()));
//                 } else if (message.data["notification_type"] == "2") {
//                   // Get.offAll(() => const NotificationScreens());
//                 }
//               }
//             }
//           }
//         }
//       },
//     );
//   }
//
//   Future<void> _showNotification(
//     String title,
//     String body,
//     String voiceEnabled,
//   ) async {
//     print("Listen");
//     var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//         'your channel id', 'your channel name',
//         channelDescription: 'your channel description',
//         importance: Importance.max,
//         priority: Priority.high,
//         enableVibration: true,
//         ticker: 'ticker');
//
//     var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
//       presentAlert: true,
//       presentSound: true,
//       presentBadge: true,
//     );
//
//     var platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: iOSPlatformChannelSpecifics);
//     await FlutterLocalNotificationsPlugin().show(0 , title, body, platformChannelSpecifics);
//
//     if (voiceEnabled == "1") {
//       speak(title);
//     }
//   }
//
//   ///
//   ///
//   ///
//
//   FlutterTts flutterTts = FlutterTts();
//   Future speak(String title) async {
//     await flutterTts.setVolume(1.0);
//     await flutterTts.setPitch(1.0);
//
//     Future.delayed(const Duration(seconds: 1), () async {
//       await flutterTts.speak(title);
//     });
//   }
//
//   Future<void> requestPermissions() async {
//     final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     if (Platform.isIOS) {
//       await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
//             alert: true,
//             badge: true,
//             sound: true,
//             critical: true,
//           );
//     } else if (Platform.isAndroid) {
//       final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
//           flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>();
//       await androidImplementation?.requestPermission();
//     }
//   }
// }
