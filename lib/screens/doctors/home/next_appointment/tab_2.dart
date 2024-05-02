import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/home/next_appointment/cancel_appointment_tab.dart';
import 'package:imedics_latest/screens/doctors/home/next_appointment/upcomming_appointment_tab.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';

import 'complete_appointment_tab.dart';

class UAppointTab extends StatelessWidget {
  final String PatientNames;
  final sletedDate;
  final String id;
  final seltedTime;

  // ConformOppointmentModel model;
  final String doctorname;
  final String specialist;

  UAppointTab(
      {super.key,
      required this.id,
      // required this.model,
      required this.PatientNames,
      required this.doctorname,
      required this.specialist,
      required this.sletedDate,
      required this.seltedTime});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
          height: 520.h,
          width: 1.sw,
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.9),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              padding10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  height: 55.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: AppColors.lightgrey,
                  ),
                  child: SegmentedTabControl(
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 4.w),
                    barDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: AppColors.lightgrey,
                    ),
                    indicatorDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: Colors.orange.shade200,
                    ),
                    // indicatorColor: Colors.orange.shade200,
                    tabTextColor: Colors.black45,
                    selectedTabTextColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: MyFonts.size14,
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: [
                      SegmentTab(
                        label: '   Upcoming',
                        gradient: LinearGradient(
                          colors: [
                            AppColors.appColor1,
                            AppColors.appColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      SegmentTab(
                        label: 'Completed    ',
                        gradient: LinearGradient(
                          colors: [
                            AppColors.appColor1,
                            AppColors.appColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      SegmentTab(
                        label: 'Cancelled',
                        gradient: LinearGradient(
                          colors: [
                            AppColors.appColor1,
                            AppColors.appColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  UpcomingTabView(
                      // meetingId: model.id.toString(),
                      // model: model,
                      // doctorname: doctorname,
                      // specialist: specialist,
                      // id: id,
                      // PatientName: PatientNames,
                      // sletedDate: sletedDate,
                      // seltedTime: seltedTime
                  ),
                  CompleteTabView(),
                  CancelTabView(),
                ],
              ))
            ],
          )),
    );
  }
}

class TabCard extends StatelessWidget {
  final String title;

  const TabCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 113.w,
      decoration: BoxDecoration(
        color: AppColors.appColor,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Center(
          child: Text(
        title,
        style: getBoldStyle(color: AppColors.white, fontSize: MyFonts.size14),
      )),
    );
  }
}
