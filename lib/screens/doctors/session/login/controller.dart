import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/screens/doctors/session/login/state.dart';

class IndividualDoctorLoginController extends GetxController{

  final state = IndividualDoctorLoginState();

  //// user login with googleSigIn account
  userGoogleSigIn(BuildContext context) {
    // services.googleSignIn(context).then((value) {
    //   Get.snackbar('google SigIn provider', '${value!.token.toString()}');
    // }).onError((error, stackTrace) {
    //   Get.snackbar('google SigIn provider ', 'GoogleSigIn $error');
    // });

    //print(ApiServices.data);
  }

  faceBookLogin() {
    // services.facebookLoginApi().then((value) {
    //   Get.snackbar('facebook  SigIn provider', '${value!.token.toString()}');
    // }).onError((error, stackTrace) {
    //   Get.snackbar(' facebook  SigIn provider', '${error.toString()}');
    // });
  }
}