import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/doctors/doctorAccounType/widgets/view.dart';
import 'package:imedics_latest/screens/doctors/session/view.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class DoctorAccountType extends StatefulWidget {
  const DoctorAccountType({super.key});

  @override
  State<DoctorAccountType> createState() => _DoctorAccountTypeState();
}

class _DoctorAccountTypeState extends State<DoctorAccountType> {
  // int index = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.appColor1,
                  AppColors.appColor,
                ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 90.w, top: 50.h),
                        child: Image.asset(
                          AppAssets.loginBg,
                          height: 272.h,
                          width: 307.7.w,
                          color: AppColors.white.withOpacity(0.1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset(
                          AppAssets.bgGradient,
                        ),
                      ),
                      Positioned(
                        bottom: 20.h,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select Type Of\nYour Account',
                                style: getBoldStyle(
                                    color: AppColors.white,
                                    fontSize: MyFonts.size26),
                              ),
                              padding10,
                              Text(
                                'Choose the type of your account,\nbe careful to change it is impossible',
                                style: getSemiBoldStyle(
                                    color: AppColors.white,
                                    fontSize: MyFonts.size14),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: 1.sw,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      padding20,
                      DoctorAccountTypeCard(
                        image: AppAssets.individualdoctor,
                        title: individual,
                        subTitle: individualDec,
                        onTap: () {
                          setState(() {
                            AppConstants.doctorAccountType = 0;
                          });
                        },
                        selectIndex: AppConstants.doctorAccountType,
                        index: 0,
                      ),
                      padding10,
                      DoctorAccountTypeCard(
                        image: AppAssets.officedoctor,
                        title: officetext,
                        subTitle: officeDec,
                        onTap: () {
                          setState(() {
                            AppConstants.doctorAccountType = 1;
                          });
                        },
                        selectIndex: AppConstants.doctorAccountType,
                        index: 1,
                      ),
                      padding10,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomButton(
                          onPressed: () {
                            if (AppConstants.doctorAccountType == 1) {
                              log('1');
                              // TODO:: Doctor office login
                            } else {
                              log('0');
                              Get.offAll(
                                () => DoctorSessionScreen(
                                  isOfficeDoctor: false,
                                ),
                              );
                            }
                          },
                          buttonText: 'Continue',
                          textStyle: getBoldStyle(
                              color: AppColors.white, fontSize: MyFonts.size18),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
