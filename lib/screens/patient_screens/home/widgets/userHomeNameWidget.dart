import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/myFonts.dart';

Widget userHomeNameWidget() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Hi ${AppConstants.userName} ",
                    style: getRegularStyle(
                        color: AppColors.textColor, fontSize: MyFonts.size16),
                  ),
                  Image.asset(
                    AppAssets.hand,
                    height: 16.h,
                    width: 16.h,
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Text(
                'How do you feel?',
                style: getExtraBoldStyle(
                    color: AppColors.textColor, fontSize: MyFonts.size24),
              ),

            ],
          ),
        ),
        Icon(Icons.notifications_active,
        color: AppColors.appColor,
        )
        // Image.asset(
        //   'assets/images/notification.png',
        //   width: 20.w,
        //   height: 20.h,
        // ),
      ],
    ),
  );
}