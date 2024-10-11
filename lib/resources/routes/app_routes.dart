import 'package:get/route_manager.dart';
import 'package:uaeerf_app/resources/routes/routes_name.dart';

import '../../app_screens/login_screens/Signup_screens.dart';
import '../../app_screens/splash_view/splash_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashView,
            page: () => const SplashView(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RoutesName.signUpScreens,
            page: () => const SignUpScreens(),
            transition: Transition.downToUp,
            transitionDuration: const Duration(milliseconds: 250)),
      ];
}
