import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';

class DoctorRecordsDetailView extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String status;
  final String rating;

  const DoctorRecordsDetailView(
      {super.key,
      required this.image,
      required this.title,
      required this.date,
      required this.status,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 251, 250, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(246, 251, 250, 1),
        centerTitle: true,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: AppColors.black,
          ),
        ),
        title: Text(
          'Appointment Details',
          style: getSemiBoldStyle(
              color: AppColors.black94,
              fontSize: 20.sp), // Make sure these style helpers exist
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width,
                height: 126.h,
                // Use the isExpanded flag
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9),
                  // border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
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
                            Container(
                              height: 81.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                // border: Border.all(color: Colors.grey.withOpacity(0.5)),
                              ),
                              child: Center(
                                child: Image.asset(
                                  image,
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            // Text section
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        title,
                                        style: getBoldStyle(
                                            color: Colors.black, fontSize: 18),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            AppAssets.star,
                                            height: 19,
                                            width: 19,
                                            color:
                                                Color.fromRGBO(231, 155, 18, 1),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            rating,
                                            style: getSemiBoldStyle(
                                                color: AppColors.black,
                                                fontSize: 14.sp),
                                          ),
                                          SizedBox(
                                            width: 16.w,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.w,
                                  ),
                                  Text(
                                    '${date}',
                                    style: getSemiBoldStyle(
                                      fontSize: 14.sp,
                                      color: Color.fromRGBO(136, 136, 136, 1),
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  RichText(
                                    text: TextSpan(
                                      style: getSemiBoldStyle(
                                        color: Color.fromRGBO(136, 136, 136, 1),
                                        fontSize: 14.sp,
                                      ),
                                      children: [
                                        TextSpan(text: 'Status: '),
                                        TextSpan(
                                          text: status,
                                          style: getSemiBoldStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.appColor),
                                        )
                                      ],
                                    ),
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
              ),
              padding16,
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width,
                // height: 126.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date & Time',
                      style:
                          getBoldStyle(color: AppColors.black, fontSize: 16.sp),
                    ),
                    padding10,
                    Container(
                      height: 44.h,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(
                          color: Color.fromRGBO(136, 144, 152, 0.85),
                          width: 1.2,
                        ),
                        color: Color.fromRGBO(136, 144, 152, 0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Monday , 31 August',
                            style: getSemiBoldStyle(
                              color: AppColors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            '09:00 AM',
                            style: getSemiBoldStyle(
                              color: AppColors.black,
                              fontSize: 14.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              padding16,
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width,
                // height: 126.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shared Documents',
                      style:
                          getBoldStyle(color: AppColors.black, fontSize: 16.sp),
                    ),
                    padding16,
                    Row(
                      children: [
                        Container(
                          height: 75.h,
                          width: 81.w,
                          // padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(
                              color: Color.fromRGBO(136, 144, 152, 0.85),
                              width: 1.2,
                            ),
                            color: Color.fromRGBO(136, 144, 152, 0.1),
                          ),
                          child: Center(
                            child: Container(
                              height: 43.h,
                              width: 43.w,
                              child: Image.asset(
                                AppAssets.bloodRep,
                                color: AppColors.appColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Blood Report',
                              style: getBoldStyle(
                                color: AppColors.black,
                                fontSize: 18.sp,
                              ),
                            ),
                            Text(
                              'Shared With Dr. Maria Elena',
                              style: getSemiBoldStyle(
                                color: AppColors.appColor,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 4.w,
                            ),
                            Text(
                              '1 Document',
                              style: getBoldStyle(
                                color: Color.fromRGBO(136, 136, 136, 1),
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              padding16,
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width,
                // height: 126.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chat History',
                      style:
                          getBoldStyle(color: AppColors.black, fontSize: 16.sp),
                    ),
                    padding16,
                    Row(
                      children: [
                        Container(
                          height: 75.h,
                          width: 70.w,
                          // padding: EdgeInsets.all(10),
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed.',
                            // maxLines: 5,
                            style: getSemiBoldStyle(
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 75.h,
                          width: 70.w,
                          // padding: EdgeInsets.all(10),
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed.',
                            // maxLines: 5,
                            style: getSemiBoldStyle(
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 75.h,
                          width: 70.w,
                          // padding: EdgeInsets.all(10),
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed.',
                            // maxLines: 5,
                            style: getSemiBoldStyle(
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 75.h,
                          width: 70.w,
                          // padding: EdgeInsets.all(10),
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed.',
                            // maxLines: 5,
                            style: getSemiBoldStyle(
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 75.h,
                          width: 70.w,
                          // padding: EdgeInsets.all(10),
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed.',
                            // maxLines: 5,
                            style: getSemiBoldStyle(
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              padding16,
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width,
                // height: 126.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Feedback',
                      style:
                          getBoldStyle(color: AppColors.black, fontSize: 16.sp),
                    ),
                    padding16,
                    Row(
                      children: [
                        Container(
                          height: 75.h,
                          width: 70.w,
                          // padding: EdgeInsets.all(10),
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed.',
                            // maxLines: 5,
                            style: getSemiBoldStyle(
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
