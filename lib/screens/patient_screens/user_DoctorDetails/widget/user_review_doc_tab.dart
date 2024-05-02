

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/user_DoctorDetails/widget/recommend_card_widget.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class UserDoctorReviewTab extends StatefulWidget {
  const UserDoctorReviewTab({super.key});

  @override
  State<UserDoctorReviewTab> createState() => _UReviewTabviewState();
}

class _UReviewTabviewState extends State<UserDoctorReviewTab> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            padding10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest review',
                  style: getMediumStyle(color: Colors.black,fontSize: 16)
                ),
                Text(
                  'See all',
                    style: getMediumStyle(color: Colors.black,fontSize: 16)
                ),
              ],
            ),
            padding10,
            Container(
              height: 150.h,
              width: 500.w,
              //  width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 10,

                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:  EdgeInsets.only(left: 10.w),
                    child: RecomondedCard(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            padding10,
            Container(
              width: 500.w,
              height: 180.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Need Help?',
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 16.w,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          'in case of any issue, contact o our care ',
                          style: getMediumStyle(
                              color: AppColors.grey, fontSize: MyFonts.size16),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: 450,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.appColor, width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.mail_outline,
                                color: AppColors.appColor,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  'IMedFix SUPPORT'.toUpperCase(),
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.appColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ])),
            ),
            Container(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
