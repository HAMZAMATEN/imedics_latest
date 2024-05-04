import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/screens/patient_screens/home/controller.dart';
import 'package:imedics_latest/utils/myFonts.dart';

Widget userNextAppointmentCard(UserHomeController controller) {
  // controller.fetchDocDetails(controller.state.patientAppointmentList[0].docId!);
  return Obx(() => Container(
        height: 190.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(colors: [
            Color(0xff5EEF8F),
            Color(0xff00A69D),
          ]),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 150.w,
                child: Image.asset('assets/images/medical_center.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: controller.state.appointmentFetchLoading.value
                  ? Center(
                      child: ShowProgressIndicator(),
                    )
                  : Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: controller.state.patientAppointmentList.length ==
                                0
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'No Appointments yet',
                                          style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: MyFonts.size18),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          'Book now',
                                          style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: MyFonts.size16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${controller.state.appointMentDoc.name}',
                                          style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: MyFonts.size18),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          '${controller.state.appointMentDoc.specialization}',
                                          style: getBoldStyle(
                                              color: Colors.white,
                                              fontSize: MyFonts.size16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 70.h,
                                    width: 150.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.h),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.alarm,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Text(
                                                  "${controller.state.patientAppointmentList[0].selectedDate}",
                                                  style: getSemiBoldStyle(
                                                      color: Colors.white,
                                                      fontSize: MyFonts.size14),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.calendar_month,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Text(
                                                  "${controller.state.patientAppointmentList[0].selectedTimeSlot}",
                                                  style: getSemiBoldStyle(
                                                      color: Colors.white,
                                                      fontSize: MyFonts.size14),
                                                )
                                              ],
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
            ),
          ],
        ),
      ));
}
