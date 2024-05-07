// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, unused_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/doctors/home/controller.dart';
import 'package:imedics_latest/screens/doctors/home/video_call_screen.dart';
import 'package:imedics_latest/screens/doctors/home/widgets/next_appointment_widgets.dart';
import 'package:imedics_latest/screens/doctors/home/widgets/reviews_widget.dart';
import 'package:imedics_latest/screens/doctors/home/widgets/view.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/settings/notifications/doctor_notification_tab.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class DoctorHomeScreens extends StatelessWidget {
  DoctorHomeScreens({Key? key}) : super(key: key);

  // @override
  @override
  Widget build(BuildContext context) {
    final doctorHomeController = Get.put(DoctorHomeController());
    doctorHomeController.getDoctorAppointmentDetails();
    doctorHomeController.init();
    log('list:${doctorHomeController.state.patientAppointmentList.length.toString()}');
    log('dId:${AppConstants.docId}');
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 251, 250, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        backgroundColor: Color.fromRGBO(246, 251, 250, 1),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            AppConstants.docName == ''
                ? Text(
                    "No details available",
                    style: TextStyle(color: Colors.black),
                  )
                : Column(
                    children: [
                      Text(
                        "Hi  ${AppConstants.docName}  ",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),

            // Text(
            //   "No details available",
            //   style: TextStyle(
            //     color: Colors.black,
            //   ),
            // ),
            Image.asset(
              AppAssets.hand,
              height: 16.h,
              width: 16.h,
            ),
          ],
        ),

      ),
      body:

      Obx(
          ()=>
              doctorHomeController.state.loading.value == true ?
                  Center(
                    child: ShowProgressIndicator(),
                  )
                  :
              CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  padding16,
                  const UTopSearchWidget(),
                  padding16,
                  DNextAppointmentWidget(
                    homeController: doctorHomeController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        UPopularDoctorCard(
                          homeController: doctorHomeController,
                          onTap: () {},
                          image: 'assets/images/Vector.png',
                          name: 'Shared Documents',
                          speciality: 'Upload on 10 May',
                          rating: 0,
                          review: '2 Documents',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 500.h,
                    child: UReviewTabview(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
