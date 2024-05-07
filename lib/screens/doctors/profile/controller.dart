import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/helpers/shared_prefrences.dart';
import 'package:imedics_latest/screens/common/accountType/view.dart';
import 'package:imedics_latest/screens/doctors/profile/state.dart';
import 'package:imedics_latest/screens/doctors/session/view.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
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

  setProfileLoading(val) {
    state.profileLoading.value = val;
  }

  setChangePasswordLoading(val) {
    state.changePAssLoading.value = val;
  }

  setUpdateProfileLoading(val) {
    state.updateProfileLoading.value = val;
  }

  init() {
    setProfileLoading(true);
    fetchDoctorDetail().then((value) {
      setProfileLoading(false);
    });
  }

  void pickImage() async {
    final pickedImage =
        await state.imagePicker.pickImage(source: ImageSource.gallery);

    state.pickedImage = pickedImage;
    update();
  }

  logout() async {
    setLoading(true);
    Future.delayed(Duration(seconds: 3), () async {
      AppConstants.clearIndDoctorValues();
      await Prefrences().saveUserId('');
      Get.offAll(
        () => AccountTypeScreen(),
      );
      setLoading(false);
    });
  }

  changePassword(
      {required String id,
      required String currentPass,
      required String newPass,
      required String confirmPass}) async {
    setChangePasswordLoading(true);
    try {
      final response = await http.post(
        Uri.parse('${AppConstants.baseUrl}/change-doctor-password/${id}'),
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
        print("Doctor login data $data");
        // user logged-in and id Fetched, handle logic to fetch details

        Get.back();
        state.confirmPasCon.clear();
        state.newPassCon.clear();
        state.currentPasCon.clear();
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

  Future<void> fetchDoctorDetail() async {
    log('fetch details');
    try {
      final response = await http.get(
        Uri.parse(
            '${AppConstants.baseUrl}/getDoctorDetail/${AppConstants.docId}'),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("Patients details data $data");
        state.docModel = UserDocModel.fromJson(data);
        // user details fetched, now storing data in constants
        state.usernameController.text = data['name'];
        state.emailController.text = data['email'];
        state.aboutYourselfController.text = data['aboutself'];

        state.imagePath.value = data['image'];

        // setting push Token and id to firebase
      } else {
        throw ("Error while fetching data");
      }
    } on InternetException {
      Snackbar.showSnackBar("No Internet Access", Icons.error_outline);
    } on TimeoutException {
      Snackbar.showSnackBar("Connection Timeout", Icons.error_outline);
    } on ServerException {
      Snackbar.showSnackBar("Internal Server Error", Icons.error_outline);
    } catch (e) {
      log('e1:$e');
      Snackbar.showSnackBar("$e", Icons.error_outline);
    }
  }
  Future<UserDocModel> fetchParticularDoctorDetail() async {

      final response = await http.get(
        Uri.parse(
            '${AppConstants.baseUrl}/getDoctorDetail/${AppConstants.docId}'),
        headers: {"Content-Type": "application/json"},
      );
        var data = jsonDecode(response.body);
      log('fetch details');

        var userDocData = UserDocModel.fromJson(data);
        return userDocData;



  }

  updateDoctorProfile(String id, UserDocModel model) async {
    setUpdateProfileLoading(true);
    try {
      log('model:${jsonEncode(model)}');

      final response = await http.post(
        Uri.parse('${AppConstants.baseUrl}/update-doctor-profile/${id}'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(model),
      );

      log('data:${response.body}');
      log('data:${response.statusCode}');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("Doctor login data $data");
        // user logged-in and id Fetched, handle logic to fetch details

        // Get.back();
        // state.confirmPasCon.clear();
        // state.newPassCon.clear();
        // state.currentPasCon.clear();
        Snackbar.showSnackBar("Successfully update profile", Icons.done);
        setUpdateProfileLoading(false);
      } else if (response.statusCode == 401) {
        setUpdateProfileLoading(false);
        Snackbar.showSnackBar("${response.body}", Icons.error_outline);
      } else if (response.statusCode == 404) {
        setUpdateProfileLoading(false);
        Snackbar.showSnackBar("${response.body}", Icons.error_outline);
      } else {
        setUpdateProfileLoading(false);
        throw ("${response.body}");
      }
    } on InternetException {
      setUpdateProfileLoading(false);
      Snackbar.showSnackBar("No Internet Access", Icons.error_outline);
    } on TimeoutException {
      setUpdateProfileLoading(false);
      Snackbar.showSnackBar("Connection Timeout", Icons.error_outline);
    } on ServerException {
      setUpdateProfileLoading(false);
      Snackbar.showSnackBar("Internal Server Error", Icons.error_outline);
    } catch (e) {
      log('e:$e');
      setUpdateProfileLoading(false);
      Snackbar.showSnackBar("$e", Icons.error_outline);
    }
  }
}
