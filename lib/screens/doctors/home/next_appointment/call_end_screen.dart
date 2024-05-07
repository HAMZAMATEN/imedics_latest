import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/models/doctors/patient_model.dart';
import 'package:imedics_latest/screens/doctors/application/view.dart';
import 'package:imedics_latest/screens/doctors/home/view.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/waiting_room/details_widget.dart';
import 'package:imedics_latest/screens/patient_screens/applicationScreens/view.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class DoctorCallEndScreen extends StatelessWidget {
  PatientModel patientModel;
  PatientAppointmentModel appoint;

  DoctorCallEndScreen({
    super.key,
    required this.patientModel,
    required this.appoint,
  });

  @override
  Widget build(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // IconButton(
                      //   icon:
                      //   const Icon(Icons.arrow_back, color: AppColors.white),
                      //   onPressed: () {
                      //     Navigator.of(context).pop();
                      //   },
                      // ),
                      Text(
                        'Consultation',
                        style: getBoldStyle(
                            color: AppColors.white, fontSize: MyFonts.size16),
                      ),
                      // IconButton(
                      //   icon: Text(""),
                      //   onPressed: () {},
                      // ),
                    ],
                  )),
            ),
            // main container
            Padding(
              padding: EdgeInsets.only(top: 450.h, right: 30.w, left: 30.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.alarm,
                    size: 50.sp,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "The Consultation Session has ended",
                    textAlign: TextAlign.center,
                    style: getSemiBoldStyle(
                        color: Colors.white, fontSize: MyFonts.size30),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButton(
                    backColor: Colors.white,
                    borderColor: AppColors.appColor,
                    buttonText: "Go to Home",
                    textColor: AppColors.appColor,
                    onPressed: () {
                      Get.offAll(() => DoctorApplicationView());
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 105.h, left: 0.w, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 137.h,
                        width: 157.w,
                        child: Image.asset(
                          'assets/images/defaultDoc.jpg',
                          // Path to your default image
                          height: 92.h,
                          width: 82.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Consultation Session with ${patientModel.username}",
                        textAlign: TextAlign.center,
                        style: getSemiBoldStyle(
                            color: Colors.white, fontSize: MyFonts.size18),
                      ),
                      padding5,
                      Text(
                        "${patientModel.email}",
                        textAlign: TextAlign.center,
                        style: getSemiBoldStyle(
                            color: Colors.white, fontSize: MyFonts.size16),
                      ),
                    ],
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
