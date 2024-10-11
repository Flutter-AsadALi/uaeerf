import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 4.0.h,
        height: 4.0.h,
        child: Image(
          image: const AssetImage("assets/images/loader.gif"),
          height: 2.h,
        ),
        // CircularProgressIndicator(
        //   color: AppColors.themeDarkColor,
        // ),
      ),
    );
  }
}
