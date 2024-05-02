
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class DNotificationCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String time;
  final String image;
  const DNotificationCard(
      {super.key,
        required this.title,
        required this.subTitle,
        required this.time,
        required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        // height: 82.h,
        width: 1.sw,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(width: 15,),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.asset(
                  image,
                  height: 50.h,
                  width: 50.h,
                ),
              ),
              padding15,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: getMediumStyle(
                        color: AppColors.appColor, fontSize: MyFonts.size14),
                  ),
                  padding5,
                  Text(
                    subTitle,
                    style: getRegularStyle(
                        color: AppColors.black, fontSize: MyFonts.size11),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: Text(
                      time,
                      style: getRegularStyle(
                          color: AppColors.black, fontSize: MyFonts.size10),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class DInvitationCard extends StatelessWidget {
  final String title;
  final String time;
  final String image;
  const DInvitationCard(
      {super.key,
        required this.title,
        required this.time,
        required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 82.h,
        width: 1.sw,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Image.asset(
                      image,
                      height: 50.h,
                      width: 50.h,
                    ),
                  ),
                  padding15,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: getMediumStyle(
                            color: AppColors.appColor, fontSize: MyFonts.size14),
                      ),
                      padding5,
                      Text(
                        time,
                        style: getRegularStyle(
                            color: AppColors.black, fontSize: MyFonts.size11),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
