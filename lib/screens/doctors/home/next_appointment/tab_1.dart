// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class UDoctorDeyailCard extends StatelessWidget {
  const UDoctorDeyailCard(
      {super.key,
        this.date,
        this.doctorName = 'N/A',
        this.time = 'N/A',
        this.special = 'N/A'});
  final String? doctorName;
  final String? date;
  final String? special;

  final String? time;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(DoctorIndHomeProvider());
    return Stack(
      children: [
        SizedBox(
          height: 265.h,
          width: 1.sw,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 52.h,
                  width: 62.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.white.withOpacity(0.4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.dental,
                        height: 26.h,
                        width: 34.w,
                      ),
                    ],
                  ),
                ),
                padding10,
                Text(
                  'Dr. $doctorName',
                  style: getBoldStyle(
                      color: AppColors.white, fontSize: MyFonts.size20),
                ),
                Text(
                  special.toString(),
                  style: getBoldStyle(
                      color: AppColors.white, fontSize: MyFonts.size16),
                ),
                padding20,
                Container(
                  height: 71.h,
                  width: 180.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.white.withOpacity(0.3),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          padding10,
                          Image.asset(
                            AppAssets.cal,
                            height: 13.h,
                            width: 13.h,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            date.toString(),
                            style: getSemiBoldStyle(
                                color: AppColors.white,
                                fontSize: MyFonts.size14),
                          )
                        ],
                      ),
                      padding4,
                      Row(
                        children: [
                          padding10,
                          Image.asset(
                            AppAssets.clock,
                            height: 13.h,
                            width: 13.h,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            time.toString(),
                            style: getSemiBoldStyle(
                                color: AppColors.white,
                                fontSize: MyFonts.size14),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/im1.png',
              height: 216.h,
              width: 145.w,
            )),
      ],
    );
  }
}
