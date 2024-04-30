import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

Widget specializationWidget({required String name,required String imagePath,required VoidCallback onTap}){
  return Padding(
    padding:  EdgeInsets.all(5.w),
    child: InkWell(
      borderRadius: BorderRadius.circular(4.r),
      onTap: onTap,
      child: Column(
        children: [
          Container(
              height: 87.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.5,
                    spreadRadius: 0
                  ),
                ],
                borderRadius: BorderRadius.circular(4.r),
                color: Colors.white,
                border: Border.all(color: Colors.grey.withOpacity(0.5),
                width: 0.2,
                ),

              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/${imagePath}',
                      fit: BoxFit.contain,
                      height: 56.h,
                      width: 56.w,
                    ),
                  ],
                ),
              )),
          padding8,
          Text(
            '${name}',
            style: getSemiBoldStyle(
                color: AppColors.black, fontSize: MyFonts.size12),
          )
        ],
      ),
    ),
  );
}