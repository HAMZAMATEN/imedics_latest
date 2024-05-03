import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndividualDoctorLoginState{

  final loginEmailCon = TextEditingController();

  final loginPasswordCon = TextEditingController();

  RxBool loading = false.obs;

}