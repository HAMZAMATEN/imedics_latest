import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/helpers/shared_prefrences.dart';
import 'package:imedics_latest/screens/doctors/profile/state.dart';
import 'package:imedics_latest/screens/doctors/session/view.dart';
import 'package:imedics_latest/utils/app_exception.dart';
import 'package:http/http.dart' as http;

class DoctorProfileController extends GetxController {
  final state = DoctorProfileState();

  setSelectedDay(String val) {
    state.slectedDays = val;
    update();
  }

  setLoading(val) {
    state.loading.value = val;
  }

  logout() async {
    setLoading(true);
    Future.delayed(Duration(seconds: 3), () async {
      AppConstants.clearIndDoctorValues();
      await Prefrences().saveUserId('');
      Get.offAll(
        () => DoctorSessionScreen(isOfficeDoctor: false),
      );
      setLoading(false);
    });
  }




  changePassword(
      {required String id,
      required String currentPass,
      required String newPass,
      required String confirmPass}) async {
    setLoading(true);
    try {
      final response = await http.post(Uri.parse('${AppConstants.baseUrl}/change-doctor-password/${id}'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "oldPassword":currentPass,
          "newPassword":newPass,
          "confirmPassword":confirmPass
        }),
      );
      log('data:${response.body}');
      log('data:${response.statusCode}');
      if(response.statusCode==200){
        var data = jsonDecode(response.body);
        print("Doctor login data $data");
        // user logged-in and id Fetched, handle logic to fetch details

        Get.back();
        state.confirmPasCon.clear();
        state.newPassCon.clear();
        state.currentPasCon.clear();
        Snackbar.showSnackBar("Password change successfully.", Icons.done);
        setLoading(false);

      }else if(response.statusCode==401){
        setLoading(false);
        Snackbar.showSnackBar("${response.body}", Icons.error_outline);
      }else if(response.statusCode==404){
        setLoading(false);
        Snackbar.showSnackBar("${response.body}", Icons.error_outline);
      }
      else{
        setLoading(false);
        throw("${response.body}");
      }
    }on InternetException {
      setLoading(false);
      Snackbar.showSnackBar("No Internet Access", Icons.error_outline);
    }
    on TimeoutException {
      setLoading(false);
      Snackbar.showSnackBar("Connection Timeout", Icons.error_outline);
    }on ServerException {
      setLoading(false);
      Snackbar.showSnackBar("Internal Server Error", Icons.error_outline);
    }
    catch(e){
      log('e:$e');
      setLoading(false);
      Snackbar.showSnackBar("$e", Icons.error_outline);
    }
  }
}
