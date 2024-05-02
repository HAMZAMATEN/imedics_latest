import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class RecomondedCard extends StatelessWidget {
  const RecomondedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: AppColors.lightgrey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  AppAssets.thumb,
                  height: 18.h,
                  width: 18.w,
                ),
                SizedBox(width: 12.w),
                Text(
                  'I Recommend The Doctor',
                  style: getSemiBoldStyle(
                      color: AppColors.black, fontSize: MyFonts.size14),
                ),
              ],
            ),
            padding10,
            Text(
              '100% satisfied with doctor. She listened very carefully and inquired complete medical history',
              style: getMediumStyle(
                  color: AppColors.grey, fontSize: MyFonts.size14),
            ),
            padding12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Verified Patient',
                  style: getSemiBoldStyle(
                      color: AppColors.appColor, fontSize: MyFonts.size12),
                ),
                Text(
                  '2 days ago',
                  style: getSemiBoldStyle(
                      color: AppColors.black, fontSize: MyFonts.size12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
