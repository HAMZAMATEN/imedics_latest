
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/home/controller.dart';
import 'package:imedics_latest/screens/doctors/home/next_appointment/tab_1.dart';
import 'package:imedics_latest/screens/doctors/home/next_appointment/tab_2.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class UserNextAppointmenyScreen extends StatelessWidget {
  final DoctorHomeController homeController;
  final String PatientNames;
  final String DoctorName;
  final String specialist;
  final String id;
  final sletedDate;
  final seltedTime;
  // ConformOppointmentModel model;
  UserNextAppointmenyScreen(
      {super.key,
        required this.PatientNames,
        required this.id,
        required this.specialist,
        required this.sletedDate,
        required this.seltedTime,
        required this.DoctorName, required this.homeController,
        // required this.model
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
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
                        icon: const Icon(Icons.arrow_back_ios,
                            color: AppColors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'Appointments',
                        style: getBoldStyle(
                            color: AppColors.white, fontSize: MyFonts.size16),
                      ),
                      Container(
                        width: 20,
                      ),
                    ],
                  )),
            ),
            Positioned(
                top: 110.h,
                child: UDoctorDeyailCard(
                  special: specialist,
                  doctorName: DoctorName,
                  time: seltedTime,
                  date: sletedDate,
                )),
            Positioned(
              top: 350.h,
              child: UAppointTab(
                homeController: homeController,
                // model: model,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
