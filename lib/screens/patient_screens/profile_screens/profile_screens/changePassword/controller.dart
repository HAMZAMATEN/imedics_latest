import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/utils/app_exception.dart';

class ChangeUserPassController extends GetxController {
  TextEditingController currentPassword  = TextEditingController();
  TextEditingController newPassword  = TextEditingController();
  TextEditingController confirmPassword  = TextEditingController();



    RxBool changePAssLoading  = false.obs;
  setChangePasswordLoading(bool val){
    changePAssLoading.value = val;
  }

  changePassword(
      {required String id,
        required String currentPass,
        required String newPass,
        required String confirmPass}) async {
    setChangePasswordLoading(true);
    try {
      final response = await http.post(
        Uri.parse('${AppConstants.baseUrl}/change-user-password/${id}'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "oldPassword": currentPass,
          "newPassword": newPass,
          "confirmPassword": confirmPass
        }),
      );
      log('data:${response.body}');
      log('data:${response.statusCode}');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        // user logged-in and id Fetched, handle logic to fetch details

        Get.back();
        confirmPassword.clear();
        newPassword.clear();
        currentPassword.clear();
        Snackbar.showSnackBar("Password change successfully.", Icons.done);
        setChangePasswordLoading(false);
      } else if (response.statusCode == 401) {
        setChangePasswordLoading(false);
        Snackbar.showSnackBar("${response.body}", Icons.error_outline);
      } else if (response.statusCode == 404) {
        setChangePasswordLoading(false);
        Snackbar.showSnackBar("${response.body}", Icons.error_outline);
      } else {
        setChangePasswordLoading(false);
        throw ("${response.body}");
      }
    } on InternetException {
      setChangePasswordLoading(false);
      Snackbar.showSnackBar("No Internet Access", Icons.error_outline);
    } on TimeoutException {
      setChangePasswordLoading(false);
      Snackbar.showSnackBar("Connection Timeout", Icons.error_outline);
    } on ServerException {
      setChangePasswordLoading(false);
      Snackbar.showSnackBar("Internal Server Error", Icons.error_outline);
    } catch (e) {
      log('e:$e');
      setChangePasswordLoading(false);
      Snackbar.showSnackBar("$e", Icons.error_outline);
    }
  }

}