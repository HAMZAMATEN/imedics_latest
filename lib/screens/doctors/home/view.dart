// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, unused_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/doctors/home/controller.dart';
import 'package:imedics_latest/screens/doctors/home/widgets/next_appointment_widgets.dart';
import 'package:imedics_latest/screens/doctors/home/widgets/reviews_widget.dart';
import 'package:imedics_latest/screens/doctors/home/widgets/view.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/settings/notifications/doctor_notification_tab.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class DoctorHomeScreens extends StatefulWidget {
  DoctorHomeScreens({Key? key}) : super(key: key);

  @override
  _DoctorHomeScreensState createState() => _DoctorHomeScreensState();
}

class _DoctorHomeScreensState extends State<DoctorHomeScreens> {
  // @override
  // void initState() {
  //   init();

  //   super.initState();
  // }

  // init() async {
  //   final id = await Global().getUserId();

  //   doctorController.DoctorSpecificDoctorDetails(id.toString());
  // }

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

  void _onRefresh() async {
    // Perform your data fetching operations here.
    await Future.delayed(Duration(milliseconds: 1000));
    // Get.put(DoctorIndHomeProvider());

    // setState(() {
    //   Get.put(DoctorIndHomeProvider());
    // });
    _refreshController.refreshCompleted();
  }

  final doctorHomeController = Get.put(DoctorHomeController());

  @override
  Widget build(BuildContext context) {
    doctorHomeController.getDoctorAppointmentDetails();
    log('list:${doctorHomeController.state.patientAppointmentList.length.toString()}');
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
            AppConstants.docName == '' ?
                Text(
                  "No details available",
                  style: TextStyle(
                    color: Colors.black
                  ),
                )
            :

                Column(
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              // Replace with MyColors.white if it's defined in your code.
              child: IconButton(
                onPressed: () {
                  Get.to(()=>DNotificationSection(),);
                  // Navigator.pushNamed(context, AppRoutes.notificationScreen); // Adjust according to your navigation setup.
                },
                icon: Stack(
                  children: [
                    Image.asset(
                      'assets/images/notification.png',
                      // Replace with your asset path
                      width: 20,
                      height: 20,
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          // Replace with MyColors.appColor if it's defined in your code.
                          radius: 4,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body:
          SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            header: WaterDropHeader(),
            onRefresh: _onRefresh,
            child:
          CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                padding16,
                const UTopSearchWidget(),
                padding16,
                DNextAppointmentWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      UPopularDoctorCard(
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
