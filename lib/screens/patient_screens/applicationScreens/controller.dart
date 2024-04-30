import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/screens/patient_screens/applicationScreens/state.dart';

class UserApplicationViewController extends GetxController{
  final state = UserApplicationViewState();


  setIndex(int index){
    state.index.value=index;
  }
}