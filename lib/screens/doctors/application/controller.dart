import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/screens/doctors/application/state.dart';
import 'package:imedics_latest/screens/doctors/profile/view.dart';

class DoctorApplicationController extends GetxController {
  final state = DoctorApplicationState();

  List<Widget> screens = [
    Center(child: Text('Home')),
    Center(child: Text('UserReport')),
    Center(child: Text('Center')),
    Center(child: Text('Record')),
    DoctorProfileView(),
  ];

  setIndex(int id) {
    state.index.value = id;
    update();
  }
}
