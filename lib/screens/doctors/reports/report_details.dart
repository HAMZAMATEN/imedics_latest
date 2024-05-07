import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/doctors/reports/controller.dart';
import 'package:imedics_latest/screens/doctors/reports/widgets/view.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class DoctorReportDetailsScreen extends StatelessWidget {
  final String appBarTitle;
  final String reportType;

  const DoctorReportDetailsScreen(
      {super.key, required this.appBarTitle, required this.reportType});

  @override
  Widget build(BuildContext context) {
    final reportController = Get.put(DoctorReportController());
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 251, 250, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(246, 251, 250, 1),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: AppColors.black,
          ),
        ),
        title: Text(
          appBarTitle,
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
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('reports')
              .where('doctor_id', isEqualTo: AppConstants.docId)
              .where('report_type', isEqualTo: reportType)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: ShowProgressIndicator(),
              );
            }

            return snapshot.data!.docs.isEmpty
                ? Center(
                    child: Text(
                      'No shared reports yet',
                      style: getSemiBoldStyle(
                          color: Colors.black, fontSize: 20.sp),
                    ),
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(18),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: DoctorDetailsAboutReportCard(
                          doctorReportController: reportController,
                          title: snapshot.data!.docs[index]['report_title']
                              .toString(),
                          date: reportController.formatMicrosecondsToDateString(
                              int.parse(
                                  snapshot.data!.docs[index]['id'].toString())),
                          onTap: () {
                            String fileUrl = snapshot
                                .data!.docs[index]['report_image']
                                .toString();
                            String filename = snapshot
                                        .data!.docs[index]['report_title']
                                        .toString() ==
                                    ''
                                ? 'image:$index'
                                : snapshot.data!.docs[index]['report_title']
                                    .toString(); // Provide the desired filename here
                            reportController.downloadFile(fileUrl, filename);
                            // controller.setSelectedReportType(textfields[index]);
                          },
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
