import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:imedics_latest/screens/patient_screens/user_DoctorDetails/widget/user_doctor_details_widget.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/myFonts.dart';
class UserDoctorDetailView extends StatelessWidget {
  UserDocModel doctor;
  double rat;
  String review;
  UserDoctorDetailView({super.key,required this.doctor,
    required this.rat,
    required this.review,
  });


  @override
  Widget build(BuildContext context) {
    print("Doc image ${doctor.image}");
    // final doctorDetails = controller.userSpecificDoctorDetailsList[0];
    // fetchSingleDocDetails();
    return Scaffold(
      body: Container(
        height: 2.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.appColor1, AppColors.appColor],
              begin: Alignment.topLeft,
              end: Alignment.topRight),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Image.asset(
                AppAssets.loginBg,
                color: AppColors.white.withOpacity(0.1),
                width: 307.w,
                height: 274.h,
              ),
            ),
            Positioned(
              right: 40.w,
              child: Image.asset(
                AppAssets.bgGradient,
                width: 307.w,
                height: 274.h,
              ),
            ),

            Positioned(
              top: 50.h,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 1.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon:
                        const Icon(Icons.arrow_back, color: AppColors.black),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Text(
                        'Platinum Provider',
                        style: getBoldStyle(
                            color: AppColors.black, fontSize: MyFonts.size16),
                      ),
                      IconButton(
                        icon: const Icon(Icons.share, color: AppColors.black),
                        onPressed: () {},
                      ),
                    ],
                  )),
            ),
            // main container
            Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: UserDoctorDetailBody(
                doctor: doctor,
                rat: rat,
                review: review,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 105.h, left: 0.w, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 137.h,
                    width: 157.w,
                    child:  doctor.image!=null?
                    CachedNetworkImage(
                      imageUrl: "${AppConstants.imageBaseUrl}/${doctor.image!}",
                      height: 92.h,
                      width: 82.w,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Container(
                          width: 50,
                          height: 50,
                          child: ShowProgressIndicator()),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/defaultDoc.jpg', // Path to your default image
                        height: 92.h,
                        width: 82.w,
                        fit: BoxFit.contain,
                      ),
                    ):Image.asset(
                      'assets/images/defaultDoc.jpg', // Path to your default image
                      height: 92.h,
                      width: 82.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 215.h, right: 25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: AppColors.appColor,
                        size: 27.h,
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 200.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25.h,
                    backgroundColor: AppColors.white,
                    child: Image.asset(
                      AppAssets.star,
                      height: 29.h,
                      width: 29.w,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
