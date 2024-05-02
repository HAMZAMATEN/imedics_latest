// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/records/doctor_details_record.dart';
import 'package:imedics_latest/screens/doctors/records/widgets/view.dart';
import 'package:imedics_latest/utils/app_assets.dart';

class DoctorRecordScreen extends StatelessWidget {
  DoctorRecordScreen({super.key});

  // final controller = Get.put(UserHomeScreenProvider());

  @override
  Widget build(BuildContext context) {
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
        body: Container(
          height: 812.h,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(246, 251, 250, 1),
          ),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            padding: EdgeInsets.only(top: 10),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 15, right: 15),
                child: InkWell(
                  onTap: () {
                    Get.to(
                      () => DoctorRecordsDetailView(
                        image: AppAssets.record,
                        title: 'Name',
                        date: 'Monday May,12,2024',
                        status: 'Completed',
                        rating: '4.9',
                      ),
                    );
                  },
                  child: UCommonRecordCard(
                    rating: '4.9',
                    image: AppAssets.record,
                    title: 'Name',
                    date: 'Monday May,12,2024',
                    status: 'Completed',
                  ),
                ),
              );
            },
          ),
        ));
  }
}
