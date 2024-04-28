import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/common/accountType/view.dart';
import 'package:imedics_latest/screens/common/onboarding/controller.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class OnboardingPageSection extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingPageSection({
    required this.title,
    required this.image,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final onBoardingCon = Get.put(OnBoardingController());
    return Container(
      height: 1.h,
      width: 1.sw,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            AppColors.appColor1,
            AppColors.appColor,
          ])),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 300.h),
              child: Text(
                'IMEDFIX',
                style: getBoldStyle(
                  color: AppColors.white.withOpacity(0.1),
                  fontSize: MyFonts.size87,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(AppAssets.bgGradient),
          ),
          Positioned(
            top: 90.h,
            right: 10,
            left: (MediaQuery.of(context).size.width - 395.w) /
                2, // Center horizontally
            child: Container(
              margin: EdgeInsets.only(top: 30.w),
              alignment: Alignment.center,
              height: 450.h,
              width: 345.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 300.h,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.1),
                      blurRadius: 3,
                      spreadRadius: 6,
                      offset: const Offset(3, 3),
                    )
                  ],
                  color: AppColors.appColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 298.h,
                    width: 1.sw,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 36, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          padding16,
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: getBoldStyle(
                                color: AppColors.black,
                                fontSize: MyFonts.size24),
                          ),
                          padding10,
                          Text(subtitle,
                              textAlign: TextAlign.center,
                              style: getSemiBoldStyle(
                                color: AppColors.grey,
                                fontSize: MyFonts.size12,
                              )),
                          padding30,
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < 3; i++)
                                  Container(
                                      margin: const EdgeInsets.all(2),
                                      width: onBoardingCon.state.value == i
                                          ? 38.w
                                          : 20.w,
                                      height: 8.h,
                                      decoration: BoxDecoration(
                                        gradient: onBoardingCon.state.value == i
                                            ? const LinearGradient(colors: [
                                                AppColors.appColor,
                                                AppColors.appColor1
                                              ])
                                            : null,
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        color: onBoardingCon.state.value == i
                                            ? AppColors.appColor
                                            : AppColors.dotColor,
                                      ))
                              ],
                            ),
                          ),
                          padding30
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 60.h,
            right: 20.w,
            child: InkWell(
              onTap: () {
                // Navigator.pushReplacementNamed(context, AppRoutes.accountType);
                Get.offAll(
                  () => AccountTypeScreen(),
                );
              },
              child: Container(
                  height: 35.h,
                  width: 98.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    border: Border.all(width: 1, color: AppColors.white),
                    color: AppColors.white.withOpacity(0.4),
                  ),
                  child: Center(
                    child: Text(
                      skip,
                      style: getBoldStyle(
                          color: AppColors.white, fontSize: MyFonts.size16),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
