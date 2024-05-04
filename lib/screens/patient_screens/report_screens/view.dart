import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/report_screens/controller.dart';
import 'package:imedics_latest/screens/patient_screens/report_screens/widgets/add_report_screen.dart';
import 'package:imedics_latest/screens/patient_screens/report_screens/widgets/userReportCardWidget.dart';
import 'package:imedics_latest/utils/app_assets.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReportViewController());
    final List<String> text = ['Blood Report', 'CT Scan', 'MRI'];
    // final List<String> textfields = ['BloodReport', 'STscan', 'MRI'];
    final List<String> image = [
      AppAssets.bloodRep,
      AppAssets.ctscan,
      AppAssets.mri
    ]; // Ensure these assets exist and are correctly referenced

    // final controller = Get.put(AddReportProvider());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff38B698).withOpacity(0.1),
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
              Get.to(()=>AddReportView(controller: controller,));
            },
            icon: Image.asset(
              AppAssets.add,
              width: 20.w,
              height: 20.h,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.homeBg), // Make sure this asset exists
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(18),
          itemCount: text.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: UReportTypeCardWidgets(
                index: index,
                date: '19 Mar 2023',
                documents: index + 1,
                title: text[index],
                img: image[index],
                onTap: () {
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
