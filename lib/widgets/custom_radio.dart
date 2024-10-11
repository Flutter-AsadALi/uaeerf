import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_colors.dart';

class CustomRadioOption extends StatelessWidget {
  final Gender? gender;

  const CustomRadioOption({super.key, this.gender});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: gender!.isSelected ? const Color(0xFF3B4257) : AppColors.white,
        child: Container(
          height: 8.h,
          width: 8.h,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                gender!.icon,
                color: gender!.isSelected ? AppColors.white : AppColors.grey,
                size: 4.h,
              ),
              // SizedBox(height: 2.h),
              Text(
                gender!.name,
                style: TextStyle(
                    color:
                        gender!.isSelected ? AppColors.white : AppColors.grey),
              )
            ],
          ),
        ));
  }
}

class Gender {
  String name;
  IconData icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
}
