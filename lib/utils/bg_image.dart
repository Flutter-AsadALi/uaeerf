import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'images_path.dart';

class AppBackgroundImage extends StatelessWidget {
  const AppBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        AppImagesPath.backgroundImage,
        fit: BoxFit.fill,
        height: 100.0.h,
        width: 100.0.w,
      ),
    );
  }
}
