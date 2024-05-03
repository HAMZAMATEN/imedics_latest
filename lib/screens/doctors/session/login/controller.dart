import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/helpers/shared_prefrences.dart';
import 'package:imedics_latest/screens/doctors/application/view.dart';
import 'package:imedics_latest/screens/doctors/session/login/state.dart';
import 'package:http/http.dart' as http;
import 'package:imedics_latest/utils/app_exception.dart';

class IndividualDoctorLoginController extends GetxController{

  final state = IndividualDoctorLoginState();




  setLoading (bool val){
    state.loading.value = val;
  }


  Future<void> loginWithEmailPass(String email,String pass) async{
    setLoading(true);
    try {
      final response = await http.post(Uri.parse('${AppConstants.baseUrl}/doctorlogin'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email":email,
          "password":pass
        }),
      );
      log('data:${response.body}');
      log('data:${response.statusCode}');
      if(response.statusCode==200){
        var data = jsonDecode(response.body);
        print("Doctor login data $data");
        // user logged-in and id Fetched, handle logic to fetch details
        await fetchDoctorDetail(data.toString());

      }else if(response.statusCode==401){
        setLoading(false);
        Snackbar.showSnackBar("Invalid password", Icons.error_outline);
      }else if(response.statusCode==404){
        setLoading(false);
        Snackbar.showSnackBar("User not found", Icons.error_outline);
      }
      else{
        setLoading(false);
        throw("Error while Login");
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



  Future<void> fetchDoctorDetail(String id) async{
    log('fetch details');
    try {
      final response = await http.get(Uri.parse('${AppConstants.baseUrl}/getDoctorDetail/${id}'),
        headers: {"Content-Type": "application/json"},
      );
      if(response.statusCode==200){
        var data = jsonDecode(response.body);
        print("Patients details data $data");
        // user details fetched, now storing data in constants
        AppConstants.docId = data['_id'];
        AppConstants.docName = data['name'];;
        AppConstants.docEmail = data['email'];
        AppConstants.docSpeciality = data['specialization'];
        AppConstants.docWallAmount = double.parse((data['__v']).toString());
        Prefrences().saveUserId(AppConstants.docId);
        Prefrences().setIsPatient(false);
        Prefrences().setDoctorType(true);
        // setting push Token and id to firebase
        setDoctorFirebaseData(data['_id']);
      }else{
        clearControllers();
        setLoading(false);
        throw("Error while fetching data");
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
      log('e1:$e');
      setLoading(false);
      Snackbar.showSnackBar("$e", Icons.error_outline);
    }
  }

  Future<void> setDoctorFirebaseData(String id) async{
    log('firebase data');
    try{
      String? pushToken = await FirebaseMessaging.instance.getToken();
      await FirebaseFirestore.instance.collection('${AppConstants.individualDoctorCollection}').doc(id).set(
          {
            'id':id,
            "pushToken":pushToken,
          }
      ).then((value){
        setLoading(false);
        Get.offAll(()=>DoctorApplicationView());
        clearControllers();
      });
    }catch(e){
      print("Exception while sending data to firebase is $e");
    }
  }



  void clearControllers(){
    state.loginPasswordCon.clear();
    state.loginEmailCon.clear();
    state.loading.value=false;
  }
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