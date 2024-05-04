import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/reports/widgets/view.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class DoctorReportDetailsScreen extends StatelessWidget {
  final String appBarTitle;
  final String reportType;
  const DoctorReportDetailsScreen({super.key, required this.appBarTitle, required this.reportType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 251, 250, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(246, 251, 250, 1),

        centerTitle: true,
        leading: IconButton(
          onPressed: (){
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
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(18),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: DoctorDetailsAboutReportCard(title: 'Report Name', date: '01/05/2024', onTap: (){
                String fileUrl =
                    'https://imdfx-newserver-production.up.railway.app/uploads/5b895e1c44e58fc94f3d38c5aee84014';
                String filename =
                    'example'; // Provide the desired filename here
                downloadFile(fileUrl, filename);
                // controller.setSelectedReportType(textfields[index]);

              },),
            );
          },
        ),
      ),
    );
  }
}


Future<void> downloadFile(String url, String filename) async {
  try {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var bytes = response.bodyBytes;

      var tempDir = await getTemporaryDirectory();

      var contentType = response.headers['content-type'];
      var extension =
      contentType != null ? contentType.split('/').last : 'unknown';
      var filePath = '${tempDir.path}/$filename.$extension';
      var file = File(filePath);
      await file.writeAsBytes(bytes);
    } else {
      print(
          'Failed to download file. Server responded with status code: ${response.statusCode}');
    }
  } catch (e) {
    // Exception occurred during the request
    print('Failed to download file: $e');
  }
}
