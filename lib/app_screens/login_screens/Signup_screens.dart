import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/label_controller/label_controller.dart';
import '../../controllers/login_controller/auth_controller.dart';
import '../../utils/images_path.dart';
import '../../utils/loading_indicator.dart';


class SignUpScreens extends StatefulWidget {
  const SignUpScreens({super.key});

  @override
  State<SignUpScreens> createState() => _SignUpScreensState();
}

class _SignUpScreensState extends State<SignUpScreens> {
  final AuthController authController = Get.find();

@override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // log(authController.fcmToken);
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          body: authController.isLoadingSignUp.value
              ? const Center(
                  child: LoadingIndicator(),
                )
              : Container(
                  height: 100.0.h,
                  width: 100.0.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        AppImagesPath.backgroundImage,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: ModalProgressHUD(
                    inAsyncCall: authController.isLoadingReload.value,
                    progressIndicator: const LoadingIndicator(),
                    child: SafeArea(
                      child: SizedBox(
                        width: 100.w,
                        child: ListView(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

}
