import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/application/controller.dart';
import 'package:imedics_latest/screens/doctors/application/widgets/view.dart';
import 'package:imedics_latest/utils/app_assets.dart';

class DoctorApplicationView extends StatelessWidget {
  const DoctorApplicationView({super.key});

  // @override
  // void initState() {
  //   FirebaseMessaging.onBackgroundMessage(BackgroundHandler);
  //   PushNotificationService pushNotificationService = PushNotificationService();
  //   pushNotificationService.initialize(context);
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final applicationController = Get.put(DoctorApplicationController());
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Obx(() => IndexedStack(
            children: [
              applicationController
                  .screens[applicationController.state.index.value],
            ],
          )),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: AppColors.whiteColor,
        surfaceTintColor: AppColors.white,
        shadowColor: AppColors.black,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.h,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.h),
            child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomBarItems(
                    title: 'Home',
                    doctorApplicationController: applicationController,
                    onTap: () {
                      applicationController.setIndex(0);
                    },
                    icon: AppAssets.home,
                    index: 0,
                  ),
                  BottomBarItems(
                    title: 'Report',
                    doctorApplicationController: applicationController,
                    onTap: () {
                      applicationController.setIndex(1);
                    },
                    icon: AppAssets.report,
                    index: 1,
                  ),
                  BottomBarItems(
                    title: 'Record',
                    doctorApplicationController: applicationController,
                    onTap: () {
                      applicationController.setIndex(3);
                    },
                    icon: AppAssets.record,
                    index: 3,
                  ),
                  BottomBarItems(
                    title: 'Profile',
                    doctorApplicationController: applicationController,
                    onTap: () {
                      applicationController.setIndex(4);
                    },
                    icon: AppAssets.profile,
                    index: 4,
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
