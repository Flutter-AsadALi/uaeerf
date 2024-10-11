import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../resources/session_controller/session_controller.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

class PrimaryButton extends StatelessWidget {
  /// Creates a PrimaryButton.
  ///
  ///
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String title;
  final VoidCallback onPressed;
  final bool enabled;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? borderColor;
  final Color? iconColor;
  final double? height;
  final double? borderWidth;
  final double? width;
  final double? fontSize;
  final Icon? icon;
  final bool isIcon;
  final TextStyle? textStyle;

  const PrimaryButton({
    Key? key,
    this.margin,
    this.padding,
    required this.title,
    required this.onPressed,
    this.enabled = true,
    this.backgroundColor,
    this.titleColor,
    this.borderColor,
    this.iconColor,
    this.height,
    this.borderWidth,
    this.width,
    this.fontSize,
    this.icon,
    this.isIcon = false,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Material(
        borderRadius: BorderRadius.circular(1.h),
        color: enabled
            ? backgroundColor ?? SessionController.themeLightColor
            : AppColors.linearGradientDark,
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: BorderRadius.circular(1.h),
          child: Container(
            width: width ?? double.infinity,
            height: height ?? 6.h,
            alignment: Alignment.center,
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.h),
              border: Border.all(
                  color: borderColor ?? AppColors.themeLightColorTwo,
                  width: borderWidth ?? 0.3.h),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // isIcon ? icon! : const SizedBox(),
                // isIcon ? const SizedBox(width: 11) : const SizedBox(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isIcon ? icon! : const SizedBox(),
                      isIcon ? const SizedBox(width: 11) : const SizedBox(),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        // ignore: unrelated_type_equality_checks
                        style: textStyle == ''
                            ? AppTextStyle.boldWhite12
                            : textStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
