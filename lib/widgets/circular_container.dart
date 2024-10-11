import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../resources/session_controller/session_controller.dart';
import '../utils/app_colors.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    required this.appIconsWidget,
    this.onPressed,
    this.isBgWhite = false,
    this.height,
    this.width,
  });
  final Widget appIconsWidget;
  final VoidCallback? onPressed;
  final bool? isBgWhite;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? 7.h,
        height: height ?? 7.h,
        decoration: BoxDecoration(
          color:
          isBgWhite! ? AppColors.white : SessionController.themeLightColor,
          shape: BoxShape.circle,
          border: Border.all(color: SessionController.themeLightColor),
        ),
        child: appIconsWidget,
      ),
    );
  }
}
