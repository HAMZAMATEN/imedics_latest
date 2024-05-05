import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/models/doctors/patient_model.dart';
import 'package:imedics_latest/screens/doctors/home/widgets/appointment_details.dart';
import 'package:imedics_latest/screens/doctors/home/controller.dart';
import 'package:imedics_latest/screens/doctors/home/next_appointment/appointment_card.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class UpcomingTabView extends StatelessWidget {
  final DoctorHomeController homeController;

  const UpcomingTabView({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child:
      homeController.state.patientAppointmentList.isEmpty ?

      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'No upcomming appointments yet',
                    style: getBoldStyle(
                        color: Colors.black,
                        fontSize: MyFonts.size18),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
          :

      ListView.builder(
          padding: EdgeInsets.only(top: 10.h),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: homeController.state.patientAppointmentList.length,
          itemBuilder: (context, index) {
            log('id:${homeController.state.patientAppointmentList[1].sId}');
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                height: 159.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FutureBuilder<PatientModel>(
                                  future: homeController
                                      .fetchParticularPatientDetails(
                                          homeController
                                              .state
                                              .patientAppointmentList[index]
                                              .userId
                                              .toString()),
                                  builder: (context,
                                      AsyncSnapshot<PatientModel> snapshot) {
                                    if (!snapshot.hasData) {
                                      return Container(
                                          height: 30.h,
                                          child: ShowProgressIndicator());
                                    }
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data!.username.toString(),
                                          style: getBoldStyle(
                                              color: AppColors.black,
                                              fontSize: MyFonts.size16),
                                        ),
                                        padding4,
                                        Text(
                                          snapshot.data!.email.toString(),
                                          style: getSemiBoldStyle(
                                              color: AppColors.grey,
                                              fontSize: MyFonts.size14),
                                        ),
                                      ],
                                    );
                                  }),

                              padding4,
                              Row(
                                children: [
                                  Image.asset(
                                    AppAssets.calender,
                                    height: 13.h,
                                    width: 13.w,
                                    color: AppColors.appColor,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    homeController
                                        .state
                                        .patientAppointmentList[index]
                                        .selectedTimeSlot
                                        .toString(),
                                    style: getMediumStyle(
                                        color: AppColors.black,
                                        fontSize: MyFonts.size12),
                                  ),
                                  SizedBox(width: 12.w),
                                  Image.asset(
                                    AppAssets.clock,
                                    height: 13.h,
                                    width: 13.w,
                                    color: AppColors.appColor,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    homeController
                                        .state
                                        .patientAppointmentList[index]
                                        .selectedDate
                                        .toString(),
                                    style: getMediumStyle(
                                        color: AppColors.black,
                                        fontSize: MyFonts.size12),
                                  )
                                ],
                              ),
                            ],
                          ),
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(5.r),
                          //   child: Image.asset(
                          //     'assets/images/img.png',
                          //     height: 72.h,
                          //     width: 72.w,
                          //   ),
                          // ),
                        ],
                      ),
                      padding4,
                      // cancelationReason == null
                      //     ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            textColor: AppColors.grey,
                            buttonHeight: 38.h,
                            buttonWidth: 157.w,
                            backColor: AppColors.white,
                            borderColor: AppColors.grey.withOpacity(0.6),
                            onPressed: () {},
                            buttonText: 'Cancel',
                          ),
                          // cancel != null ? 'Cancel' : 'Add Review'),
                          CustomButton(
                              textColor: AppColors.white,
                              buttonHeight: 38.h,
                              buttonWidth: 157.w,
                              onPressed: () {
                                Get.to(() => AppointmentDetailView(
                                    image: AppAssets.record,
                                    patientAppointmentModel: homeController
                                        .state
                                        .patientAppointmentList[index],
                                    homeController: homeController));
                              },
                              buttonText: 'Records'),
                          // reschedule != null ? 'Reschedule' : 'Book Again'),
                        ],
                      )
                      // : CustomButton(
                      // textColor: AppColors.grey,
                      // buttonHeight: 38.h,
                      // buttonWidth: 322.w,
                      // backColor: AppColors.white,
                      // borderColor: AppColors.grey.withOpacity(0.6),
                      // onPressed: () {},
                      // buttonText: 'Cancellation Reason'),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
