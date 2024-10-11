import 'dart:async';

import 'package:get/get.dart';

import '../../app_helper/dashboard_helper.dart';

import '../../network_client/network_clients.dart';



class DashboardControllers extends GetxController {
  ///
  ///
  ///
  RxBool isLoadingDashboard = false.obs;
  RxBool isLoadingUpdateDashboard = false.obs;
  RxBool permissionPerma = true.obs;
  bool isOnline = false;
  late DashboardHelper dashboardHelper;

  int techStatus = 0;
  RxBool techStatusBool = false.obs;
  String taskId = "";
  // final Location location = Location();
   Timer? timerUploadLocation;
   Timer? timerSetStatus;


  RxBool isAccess = false.obs;

  ///
  ///
  ///
  @override

  void onInit() {
    // timerSetStatus!.cancel()
    dashboardHelper = DashboardHelper(Get.find<NetworkClient>());
    // uploadPositionHelper = UploadPositionHelper(Get.find<NetworkClient>());
    super.onInit();
  }


  /*-------------------------------------------------------------------------- */
  /*                  updateDashboardData                                     */
  /*-------------------------------------------------------------------------- */
  updateDashboardData() async {
    isLoadingUpdateDashboard.value = true;
    // final response = await dashboardHelper.getDataDashboard();
    // if (response.data != null) {
    //   dashboardModel = response.data!;
    //   isLoadingUpdateDashboard.value = false;
    // }
  }
  }

