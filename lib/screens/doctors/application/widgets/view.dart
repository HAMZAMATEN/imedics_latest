import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/application/controller.dart';

class BottomBarItems extends StatelessWidget {
  const BottomBarItems({
    super.key,
    required this.doctorApplicationController,
    required this.onTap,
    required this.icon,
    required this.index,
    required this.title,
  });

  final DoctorApplicationController doctorApplicationController;
  final Function() onTap;
  final String icon;
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 70.w,
        height: 47.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Image.asset(icon,
                  width: 20.w,
                  height: 20.h,
                  color: doctorApplicationController.state.index.value == index
                      ? AppColors.appColor
                      : AppColors.grey),
            ),
            Obx(
              () => Text(
                title,
                style: getSemiBoldStyle(
                    color:
                        doctorApplicationController.state.index.value == index
                            ? AppColors.appColor
                            : AppColors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
