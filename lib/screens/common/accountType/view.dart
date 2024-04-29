import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/helpers/shared_prefrences.dart';
import 'package:imedics_latest/screens/common/accountType/controller.dart';
import 'package:imedics_latest/screens/common/accountType/widgets/view.dart';
import 'package:imedics_latest/screens/common/onboarding/view.dart';
import 'package:imedics_latest/screens/common/splash/view.dart';
import 'package:imedics_latest/screens/doctors/doctorAccounType/view.dart';
import 'package:imedics_latest/screens/patient_screens/auth_screens/tab_view.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountTypeController = Get.put(AccountTypeController());
    SharedPrefrences sharedPrefrences = SharedPrefrences();
    return Scaffold(
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
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
              Container(
                width: 1.sw,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Obx(
                  () => Column(
                    children: [
                      padding20,
                      AccountTypeCard(
                        image: AppAssets.asPatient,
                        title: patient,
                        subTitle: patientDec,
                        onTap: () {
                          accountTypeController.index.value = 0;
                          AppConstants.accountType = 0;
                          sharedPrefrences.saveUserindex(
                              AppConstants.accountType.toString());
                        },
                        selectIndex: accountTypeController.index.value,
                        index: 0,
                      ),
                      padding10,
                      AccountTypeCard(
                        image: AppAssets.doctorpro,
                        title: doctor,
                        subTitle: doctorDec,
                        onTap: () {
                          accountTypeController.index.value = 1;
                          AppConstants.accountType = 1;
                          sharedPrefrences.saveUserindex(
                              AppConstants.accountType.toString());
                        },
                        selectIndex: accountTypeController.index.value,
                        index: 1,
                      ),
                      padding10,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomButton(
                          onPressed: () {
                            if (accountTypeController.index.value == 1) {
                              // write code for doctore screen navigation
                              Get.offAll(
                                () => DoctorAccountType(),
                              );
                            } else {
                              Get.offAll(() => AuthTabView());
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
