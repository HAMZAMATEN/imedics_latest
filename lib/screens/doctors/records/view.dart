// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/models/doctors/patient_model.dart';
import 'package:imedics_latest/screens/doctors/records/controller.dart';
import 'package:imedics_latest/screens/doctors/records/doctor_details_record.dart';
import 'package:imedics_latest/screens/doctors/records/widgets/view.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class DoctorRecordScreen extends StatelessWidget {
  DoctorRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final recordController = Get.put(DoctorRecordController());
    recordController.getDoctorAppointmentDetails();
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 251, 250, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Color.fromRGBO(246, 251, 250, 1),
        centerTitle: true,
        title: Text(
          'Records',
          style: getSemiBoldStyle(
              color: AppColors.black94,
              fontSize: 20), // Make sure these style helpers exist
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Container(
          height: 812.h,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(246, 251, 250, 1),
          ),
          child: recordController.state.appointmentFetchLoading == true
              ? Center(
                  child: ShowProgressIndicator(),
                )
              : recordController.state.completedAppointmentList.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'No records avalible yet',
                            style:
                                getBoldStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: recordController
                          .state.completedAppointmentList.length,
                      padding: EdgeInsets.only(top: 10),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 15, right: 15),
                          child: InkWell(
                            onTap: () {
                              Get.to(
                                () => DoctorRecordsDetailView(
                                  image: AppAssets.record,
                                    recordController: recordController,
                                    patientAppointmentModel: recordController
                                        .state.completedAppointmentList[index],
                                ),
                              );
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              width: screenWidth,
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
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              // border: Border.all(color: Colors.grey.withOpacity(0.5)),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                AppAssets.record,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FutureBuilder<PatientModel>(
                                                    future: recordController
                                                        .fetchParticularPatientDetails(
                                                            recordController
                                                                .state
                                                                .completedAppointmentList[
                                                                    index]
                                                                .userId
                                                                .toString()),
                                                    builder: (context,
                                                        AsyncSnapshot<
                                                                PatientModel>
                                                            snapshot) {
                                                      if (!snapshot.hasData) {
                                                        return Container(
                                                            height: 30.h,
                                                            child:
                                                                ShowProgressIndicator());
                                                      }
                                                      return Text(
                                                        snapshot.data!.username
                                                            .toString(),
                                                        style: getBoldStyle(
                                                            color:
                                                                AppColors.black,
                                                            fontSize:
                                                                MyFonts.size16),
                                                      );
                                                    }),
                                                SizedBox(
                                                  height: 4.w,
                                                ),
                                                Text(
                                                  recordController.convertDate(
                                                      recordController
                                                          .state
                                                          .completedAppointmentList[
                                                      index]
                                                          .selectedDate
                                                          .toString()
                                                  ),
                                                  style: getSemiBoldStyle(
                                                    fontSize: 14.sp,
                                                    color: Color.fromRGBO(
                                                        136, 136, 136, 1),
                                                  ),
                                                ),
                                                SizedBox(height: 15.h),
                                                RichText(
                                                  text: TextSpan(
                                                      style: getSemiBoldStyle(
                                                        color: Color.fromRGBO(
                                                            136, 136, 136, 1),
                                                        fontSize: 14.sp,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                            text: 'Status: '),
                                                        TextSpan(
                                                          text: 'Completed',
                                                          style: getSemiBoldStyle(
                                                              fontSize: 14.sp,
                                                              color: AppColors
                                                                  .appColor),
                                                        )
                                                      ]),
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
                          ),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
