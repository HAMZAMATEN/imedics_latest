import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/reports/controller.dart';
import 'package:imedics_latest/screens/doctors/reports/report_details.dart';
import 'package:imedics_latest/screens/doctors/reports/widgets/view.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class DoctorReportScreen extends StatelessWidget {
  const DoctorReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('hello from reports');
    // Ensure these assets exist and are correctly referenced
    final controller = Get.put(DoctorReportController());

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
        child: ListView.builder(
          padding: const EdgeInsets.all(18),
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
                child: DoctorReportCardWidget(
                  index: index,
                  isExpanded: false,
                  date: '19 Mar 2023',
                  patientName: 'Patient Name',
                  title: controller.state.text[index],
                  img: controller.state.image[index],
                  // onTap: () {
                  //   String fileUrl =
                  //       'https://imdfx-newserver-production.up.railway.app/uploads/5b895e1c44e58fc94f3d38c5aee84014';
                  //   String filename =
                  //       'example'; // Provide the desired filename here
                  //   downloadFile(fileUrl, filename);
                  //   // controller.setSelectedReportType(textfields[index]);
                  // },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

