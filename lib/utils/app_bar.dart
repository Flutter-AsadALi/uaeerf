import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBackPressed;
  final bool centerTitle;
  final bool showBackArrowIcon;
  final double elevation;
  final List<Widget>? actions;
  final TabBar? bottom;

  const PrimaryAppBar({
    Key? key,
    this.title,
    this.onBackPressed,
    this.centerTitle = true,
    this.showBackArrowIcon = true,
    this.elevation = 1.0,
    this.actions,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double setSize = 10.h;
    if (screenSize.width <= 500) {
      setSize = 12.h;
    } else {
      setSize = 8.h;
    }
    return SizedBox(
      height: setSize,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.linearGradientLight, // Define your start color here
              AppColors.linearGradientDark, // Define your end color here
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          // Set to transparent to show the gradient
          elevation: elevation,
          title: FittedBox(
            child: Text(
              title ?? '',
              style: AppTextStyle.boldWhite14,
            ),
          ),
          centerTitle: centerTitle,
          leading: showBackArrowIcon
              ? GestureDetector(
                  onTap: onBackPressed,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                    size: 3.5.h,
                  ),
                )
              : Container(),
          actions: actions,
          bottom: bottom,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
// ignore: avoid_unnecessary_containers
// flexibleSpace: Container(
//   child: Image(
//     image: AssetImage(
//       AppImagesPath.appBar,
//     ),
//     fit: BoxFit.cover,
//   ),
// ),