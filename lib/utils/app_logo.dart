import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../utils/images_path.dart';
class AppLogoScreen extends StatelessWidget {
  const AppLogoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenSize > 500 ? 55.w : 77.9.w,
      height: screenSize > 500 ? 9.0.h : 8.07.h,
      child: Image.asset(
        AppImagesPath.fullAppLogoImage,
        fit: BoxFit.contain,
      ),
    );
  }
}