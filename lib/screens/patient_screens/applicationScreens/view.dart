import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/applicationScreens/controller.dart';
import 'package:imedics_latest/screens/patient_screens/applicationScreens/widgets/navBarItem.dart';
import 'package:imedics_latest/screens/patient_screens/home/view.dart';
import 'package:imedics_latest/screens/patient_screens/profile_screens/profile_view.dart';
import 'package:imedics_latest/utils/app_assets.dart';

class UserApplicationView extends StatefulWidget {
  const UserApplicationView({super.key});

  @override
  State<UserApplicationView> createState() => _UserApplicationViewState();
}

class _UserApplicationViewState extends State<UserApplicationView> {
  Widget build(BuildContext context) {
    final controller = Get.put(UserApplicationViewController());
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,

      body: controller.state.index.value == 0
          ? UserHomePage()
          : controller.state.index.value == 1
              ? Container(
                  child: Center(
                    child: Text('2'),
                  ),
                )
              : controller.state.index.value == 2
                  ? Container(
                      child: Center(
                        child: Text('2'),
                      ),
                    )
                  : controller.state.index.value == 3
                      ? Container(
                          child: Center(
                            child: Text('3'),
                          ),
                        )
                      : ProfileView(),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        child: Image.asset(
          AppAssets.add,
          width: 25.w,
          height: 25.h,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: AppColors.whiteColor,
        surfaceTintColor: AppColors.white,
        shadowColor: AppColors.black,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.h,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomBarItem(
                title: 'Home',
                controller: controller,
                onTap: () {
                  setState(() {
                    controller.setIndex(0);
                  });
                },
                icon: AppAssets.home,
                index: 0,
              ),
              BottomBarItem(
                title: 'Report',
                controller: controller,
                onTap: () {
                  setState(() {
                    controller.setIndex(1);
                  });
                },
                icon: AppAssets.report,
                index: 1,
              ),
              SizedBox(
                width: 40.w,
              ),
              BottomBarItem(
                title: 'Record',
                controller: controller,
                onTap: () {
                  setState(() {
                    controller.setIndex(3);
                  });
                },
                icon: AppAssets.record,
                index: 3,
              ),
              BottomBarItem(
                title: 'Profile',
                controller: controller,
                onTap: () {
                  setState(() {
                    controller.setIndex(4);
                  });
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
