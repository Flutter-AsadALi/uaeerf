import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../resources/session_controller/session_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

class ChoosePhotoBottomSheet extends StatelessWidget {
  const ChoosePhotoBottomSheet({
    Key? key,
    required this.onTakePhotoPressed,
    required this.onChooseFromLibraryPressed,
  }) : super(key: key);
  final VoidCallback onTakePhotoPressed;
  final VoidCallback onChooseFromLibraryPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 2.0.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(1.h),
          topRight: Radius.circular(1.h),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(1.0.h),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.lightGrey,
                  width: 0.3.h,
                ),
              ),
            ),
            child: Text(
              'Upload a photo',
              style: AppTextStyle.regularBlack12,
            ),
          ),
          SizedBox(height: 1.h),
          InkWell(
            onTap: onChooseFromLibraryPressed,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 4.h,
                vertical: 2.0.h,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.image,
                    size: 4.h,
                    color: SessionController.themeDarkColor,
                  ),
                  const SizedBox(width: 24.0),
                  Text(
                    'Choose from library',
                    style: AppTextStyle.regularBlack12,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: onTakePhotoPressed,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 4.h,
                vertical: 2.0.h,
              ),
              width: double.infinity,
              child: Row(
                children: [
                  Icon(
                    Icons.camera_alt,
                    size: 4.0.h,
                    color: SessionController.themeDarkColor,
                  ),
                  SizedBox(width: 4.h),
                  Text(
                    'Take Photo',
                    style: AppTextStyle.regularBlack12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}