// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/reports/controller.dart';
import 'package:imedics_latest/utils/app_assets.dart';

class DoctorReportCardWidget extends StatelessWidget {
  final String date;
  final String patientName;
  final String title;
  final String img;
  final int index;
  final bool isExpanded; // Added
  // final Function() onTap; // Added

  DoctorReportCardWidget({
    required this.date,
    required this.index,
    required this.patientName,
    required this.title,
    required this.img,
    required this.isExpanded, // Modified
    // required this.onTap, // Modified
  }) ;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: isExpanded ? 190.h : 126.h,
      // Use the isExpanded flag
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
      ),
      // The rest of your widget code remains the same
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Row(
                children: [
                  // Image container
                  index == index
                      ? Container(
                          height: 81.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.5)),
                          ),
                          child: Center(
                            child: Image.asset(
                              img,
                              width: 45,
                              height: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : SizedBox(),
                  SizedBox(width: 10.w),
                  // Text section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style:
                              getBoldStyle(color: Colors.black, fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Appointment on: ${date}',
                          style: getSemiBoldStyle(
                            color: Color.fromRGBO(136, 136, 136, 1),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        RichText(
                          text: TextSpan(
                              style: getSemiBoldStyle(
                                color: Color.fromRGBO(136, 136, 136, 1),
                              ),
                              children: [
                                TextSpan(text: 'Shared By: '),
                                TextSpan(
                                  text: patientName,
                                  style: getSemiBoldStyle(
                                      color: AppColors.appColor),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Action buttons row
        ],
      ),
    );
  }
}

class DoctorDetailsAboutReportCard extends StatelessWidget {
  final String title;
  final String date;
  final VoidCallback onTap;
  final DoctorReportController doctorReportController;

  const DoctorDetailsAboutReportCard(
      {super.key,
      required this.title,
      required this.date,
      required this.onTap, required this.doctorReportController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 52.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(136, 144, 152, 0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Container(
                    width: 26.w,
                    height: 28.h,
                    child: Image.asset(
                      AppAssets.report,
                      color: AppColors.appColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Upload: $date',
                    style: getBoldStyle(
                        color: Color.fromRGBO(136, 136, 136, 1),
                        fontSize: 14.sp),
                  ),
                ],
              ),
            ],
          ),
          Obx(
            () =>
            doctorReportController.state.downloadImgLoading.value == true?
            Center(
              child: ShowProgressIndicator(),
            )
                :
                Column(
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 22.h,
                    width: 22.w,
                    child: Image.asset(
                      AppAssets.download,
                      color: AppColors.appColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Download',
                  style: getSemiBoldStyle(
                      color: Color.fromRGBO(136, 136, 136, 1), fontSize: 18),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
