// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
//
//
// class ContainerLinerGradient extends StatefulWidget {
//   final String icon;
//   final String labelName;
//   final VoidCallback? onPressed;
//   final List<Color> activeColor;
//   final int selectVal;
//
//   // final Function? activeColor;
//   // final bool isActive;
//
//   const ContainerLinerGradient( // activeOption,
//       {
//     super.key,
//     required this.icon,
//     required this.labelName,
//     required this.onPressed,
//     required this.activeColor,
//     required this.selectVal,
//   });
//
//   @override
//   State<ContainerLinerGradient> createState() => _ContainerLinerGradientState();
// }
//
// class _ContainerLinerGradientState extends State<ContainerLinerGradient> {
//   HomeController homeController = Get.find();
//   List<Color> myColor = [];
//
//   @override
//   void initState() {
//     print("widget.activeColo");
//     print(widget.activeColor);
//     // myColor= widget.activeColor!();
//     // homeController.setActiveColor();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     HomeController homeController = Get.find();
//     print("homeController.selectedArray[widget.selectVal]");
//     print(homeController.selectedArray[widget.selectVal]);
//
//     // var
//     return Obx(() {
//       return homeController.isLoadingHome.value
//           ? const SizedBox()
//           : InkWell(
//               onTap: widget.onPressed,
//               child: Container(
//                 width: 20.w,
//                 // height: 5.h,
//                 margin: EdgeInsets.symmetric(vertical: 0.h, horizontal: 1.w),
//                 padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 0.h),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(2.h),
//                   border: Border.all(
//                       color: AppColors.themeLightColorTwo, width: 0.3.h),
//                   gradient: LinearGradient(
//                     begin: Alignment.bottomLeft,
//                     end: Alignment.topRight,
//                     colors: homeController.selectedArray[widget.selectVal]
//                         ? [
//                             AppColors.linearGradientLight,
//                             AppColors.linearGradientDark
//                           ]
//                         : [
//                             AppColors.paleGrey,
//                             AppColors.paleGrey,
//                           ],
//                   ),
//                 ),
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         widget.icon ?? '',
//                         height: 3.h,
//                         width: 3.h,
//                       ),
//                       SizedBox(
//                         height: 0.5.h,
//                       ),
//                       SizedBox(
//                         child: Text(
//                           widget.labelName ?? '',
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           maxLines: 2,
//                           style: AppTextStyle.boldBlack10,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             );
//     });
//   }
// }
