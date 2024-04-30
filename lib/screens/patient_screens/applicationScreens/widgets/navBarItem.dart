import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/applicationScreens/controller.dart';


class BottomBarItem extends StatelessWidget {
  UserApplicationViewController controller;
  VoidCallback onTap;
   String icon;
   int index;
   String title;

   BottomBarItem({
    super.key,
     required this.controller,
    required this.onTap,
    required this.icon,
    required this.index,
    required this.title,
  });



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
            Image.asset(icon,
                width: 20.w,
                height: 20.h,
                color: controller.state.index.value == index
                    ? AppColors.appColor
                    : AppColors.grey),
            Text(
              title,
              style: getSemiBoldStyle(
                  color:  controller.state.index.value == index
                      ? AppColors.appColor
                      : AppColors.grey),
            )
          ],
        ),
      ),
    );
  }
}
