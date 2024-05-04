import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/models/doctors/patient_model.dart';
import 'package:imedics_latest/screens/doctors/reports/controller.dart';
import 'package:imedics_latest/screens/doctors/reports/report_details.dart';
import 'package:imedics_latest/screens/doctors/reports/widgets/view.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:http/http.dart' as http;
import 'package:imedics_latest/utils/myFonts.dart';
import 'package:path_provider/path_provider.dart';

class DoctorReportScreen extends StatelessWidget {
  const DoctorReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('hello from reports');
    // Ensure these assets exist and are correctly referenced
    final controller = Get.put(DoctorReportController());
    controller.getDoctorAppointmentDetails();
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 251, 250, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(246, 251, 250, 1),
        centerTitle: true,
        title: Text(
          'Reports',
          style: getSemiBoldStyle(
              color: AppColors.black94,
              fontSize: 20), // Make sure these style helpers exist
        ),
        actions: [
          IconButton(
            onPressed: () {
              // controller.GetConformAppointment(
              //     context, controller.docId.toString());

              // Navigator.pushNamed(context, AppRoutes.addReportScreen);
            },
            icon: Image.asset(
              AppAssets.delete,
              width: 25.w,
              height: 25.h,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(246, 251, 250, 1),
        ),
        child: controller.state.patientAppointmentList.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'No reports available',
                            style: getBoldStyle(
                                color: Colors.black, fontSize: MyFonts.size18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: ListView.builder(
                  itemCount: controller.state.patientAppointmentList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            () => DoctorReportDetailsScreen(
                              appBarTitle: controller.state.text[index],
                            ),
                          );
                        },
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection(AppConstants.userCollection)
                              .where('id',
                                  isEqualTo: controller.state
                                      .patientAppointmentList[index].userId
                                      .toString())
                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Container();
                            }
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, firebaseIndex) {
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    width: screenWidth,
                                    height: 126.h,
                                    // Use the isExpanded flag
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(9),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.5),
                                          width: 1),
                                    ),
                                    // The rest of your widget code remains the same
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 15.w),
                                            child: Row(
                                              children: [
                                                // Image container
                                                index == index
                                                    ? Container(
                                                        height: 81.h,
                                                        width: 80.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r),
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5)),
                                                        ),
                                                        child: Center(
                                                          child: Image.asset(
                                                            controller.state
                                                                .image[index],
                                                            width: 45,
                                                            height: 45,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                SizedBox(width: 10.w),
                                                // Text section
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .state.text[index],
                                                        style: getBoldStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      Text(
                                                        'Appointment on: ${controller.convertDate(controller.state.patientAppointmentList[index].selectedDate.toString())}',
                                                        style: getSemiBoldStyle(
                                                          color: Color.fromRGBO(
                                                              136, 136, 136, 1),
                                                        ),
                                                      ),
                                                      SizedBox(height: 4.h),
                                                      FutureBuilder<
                                                              PatientModel>(
                                                          future: controller
                                                              .fetchParticularPatientDetails(
                                                                  controller
                                                                      .state
                                                                      .patientAppointmentList[
                                                                          index]
                                                                      .userId
                                                                      .toString()),
                                                          builder: (context,
                                                              AsyncSnapshot<
                                                                      PatientModel>
                                                                  snapshot) {
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Container(
                                                                  height: 30.h,
                                                                  child:
                                                                      ShowProgressIndicator());
                                                            }
                                                            return RichText(
                                                              text: TextSpan(
                                                                style:
                                                                    getSemiBoldStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          136,
                                                                          136,
                                                                          136,
                                                                          1),
                                                                ),
                                                                children: [
                                                                  TextSpan(
                                                                      text:
                                                                          'Shared By: '),
                                                                  TextSpan(
                                                                    text: snapshot
                                                                        .data!
                                                                        .username
                                                                        .toString(),
                                                                    style: getSemiBoldStyle(
                                                                        color: AppColors
                                                                            .appColor),
                                                                  )
                                                                ],
                                                              ),
                                                            );
                                                          })
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
                                  );
                                });
                          },
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
