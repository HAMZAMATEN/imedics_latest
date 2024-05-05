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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: ListView.builder(
            itemCount: controller.state.text.length,
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
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: screenWidth,
                    height: 126.h,
                    // Use the isExpanded flag
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.5), width: 1),
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
                                index == index
                                    ? Container(
                                        height: 81.h,
                                        width: 80.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5)),
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            controller.state.image[index],
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
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.state.text[index],
                                        style: getBoldStyle(
                                            color: Colors.black, fontSize: 18),
                                        overflow: TextOverflow.ellipsis,
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
