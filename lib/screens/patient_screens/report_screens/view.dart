import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/controller.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/widgets/report_expenstionTile_widget.dart';
import 'package:imedics_latest/screens/patient_screens/report_screens/controller.dart';
import 'package:imedics_latest/screens/patient_screens/report_screens/widgets/repo_exp_tile.dart';

import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

import 'widgets/add_report_screen.dart';

class ReportView extends StatelessWidget {
  ReportView({super.key, });

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(AllAppointmentController());
    final controller = Get.put(ReportViewController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(()=>AddReportView(controller: controller,));
            },
            icon: Icon(
              Icons.add,
              color: AppColors.appColor,
              size: 35,
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          "Reports",
          style: getSemiBoldStyle(
              color: AppColors.appColor, fontSize: MyFonts.size22),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: SafeArea(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                  curve: Curves.easeInOut,
                  width: MediaQuery.of(context).size.width,
                  // height: 126.h,
                  decoration: BoxDecoration(
                    color: AppColors.bgColor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'All uploaded reports',
                        style: getBoldStyle(
                            color: AppColors.black, fontSize: 20.sp),
                      ),
                      padding16,
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection(AppConstants.userCollection)
                              .where('id', isEqualTo: "${AppConstants.userId}")
                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: ShowProgressIndicator());
                            }
                            return snapshot.data!.docs.isEmpty
                                ? Center(
                              child: Text(
                                'No documents shared yet',
                                style: getBoldStyle(color: Colors.black),
                              ),
                            )
                                : ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  List bloodReports = snapshot
                                      .data!.docs[index]['Blood-Report'];
                                  List ctScanReport =
                                  snapshot.data!.docs[index]['CT-Scan'];
                                  List mriReport =
                                  snapshot.data!.docs[index]['MRI'];
                                  print(bloodReports.length);
                                  print(ctScanReport.length);
                                  print(mriReport.length);
                                  return bloodReports.length == 0 &&
                                      ctScanReport.length == 0 &&
                                      mriReport.length == 0
                                      ? Center(
                                    child: Text(
                                      'No documents shared yet',
                                      style: getSemiBoldStyle(
                                          color: Colors.black),
                                    ),
                                  )
                                      : Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      bloodReports.length == 0
                                          ? Container(
                                        child: Text(
                                          "No Blood Reports",
                                          style: getBoldStyle(
                                              color: AppColors
                                                  .appColor,
                                              fontSize: MyFonts
                                                  .size22),
                                        ),
                                      )
                                          : Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            "Blood Reports",
                                            style: getBoldStyle(
                                                color: AppColors
                                                    .appColor,
                                                fontSize: MyFonts
                                                    .size22),
                                          ),
                                          ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                              BouncingScrollPhysics(),
                                              itemCount:
                                              bloodReports
                                                  .length,
                                              itemBuilder:
                                                  (context,
                                                  index) {
                                                index =
                                                    index - 1;
                                                return repoExpansionTile(
                                                    context,
                                                    "Blood Report",
                                                    "${bloodReports[index + 1]}",);
                                              }),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.black54,
                                      ),
                                      ctScanReport.length == 0
                                          ? Container(
                                        child: Text(
                                          "No CT-Scan",
                                          style: getBoldStyle(
                                              color: AppColors
                                                  .appColor,
                                              fontSize: MyFonts
                                                  .size22),
                                        ),
                                      )
                                          : Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            "CT-Scan Reports",
                                            style: getBoldStyle(
                                                color: AppColors
                                                    .appColor,
                                                fontSize: MyFonts
                                                    .size22),
                                          ),
                                          ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                              BouncingScrollPhysics(),
                                              itemCount:
                                              ctScanReport
                                                  .length,
                                              itemBuilder:
                                                  (context,
                                                  index) {
                                                index =
                                                    index - 1;
                                                return repoExpansionTile(
                                                    context,
                                                    "CT-Scan",
                                                    "${ctScanReport[index + 1]}",);
                                              }),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.black54,
                                      ),
                                      mriReport.length == 0
                                          ? Container(
                                        child: Text(
                                          "No MRI Reports",
                                          style: getBoldStyle(
                                              color: AppColors
                                                  .appColor,
                                              fontSize: MyFonts
                                                  .size22),
                                        ),
                                      )
                                          : Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            "MRI Reports",
                                            style: getBoldStyle(
                                                color: AppColors
                                                    .appColor,
                                                fontSize: MyFonts
                                                    .size22),
                                          ),
                                          ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                              BouncingScrollPhysics(),
                                              itemCount:
                                              mriReport
                                                  .length,
                                              itemBuilder:
                                                  (context,
                                                  index) {
                                                index =
                                                    index - 1;
                                                return repoExpansionTile(
                                                    context,
                                                    "MRI Report",
                                                    "${mriReport[index + 1]}",);
                                              }),
                                        ],
                                      ),
                                    ],
                                  );
                                });
                          }),
                      padding16,
                      padding16,
                      padding16,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
