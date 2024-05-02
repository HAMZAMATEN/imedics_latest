import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/screens/doctors/application/state.dart';
import 'package:imedics_latest/screens/doctors/home/view.dart';
import 'package:imedics_latest/screens/doctors/profile/view.dart';
import 'package:imedics_latest/screens/doctors/records/view.dart';
import 'package:imedics_latest/screens/doctors/reports/view.dart';

class DoctorApplicationController extends GetxController {
  final state = DoctorApplicationState();

  List<Widget> screens = [
    DoctorHomeScreens(),
    DoctorReportScreen(),
    Center(child: Text('Center')),
    DoctorRecordScreen(),
    DoctorProfileView(),
  ];

  setIndex(int id) {
    state.index.value = id;
    update();
  }
}
