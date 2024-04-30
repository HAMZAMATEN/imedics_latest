import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/helpers/shared_prefrences.dart';
import 'package:imedics_latest/screens/common/onboarding/view.dart';
import 'package:imedics_latest/screens/patient_screens/applicationScreens/view.dart';
import 'package:imedics_latest/utils/app_exception.dart';

class SplashController extends GetxController {
  init() async {
    Future.delayed(Duration(seconds: 3), () async {
      String? userId = await Prefrences().getUserId();
      String? userindex = await Prefrences().getUserindex();
      if (userId == null || userId.isEmpty) {
        Get.offAll(
          () => OnbordingScreen(),
        );
      } else {
        if (userindex == '1') {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DoctorMainMenuScreenMain(),
          //   ),
          // );
          print(" indexsss1 ====>>>> ${userindex.toString()}");
        } else {
          // Navigator.pushReplacementNamed(context, AppRoutes.userMainMenuScreen);
          print(" indexsss2 ${AppConstants.accountType.toString()}");
        }
      }
    });
  }

  void checkLogin(){
    Future.delayed(Duration(seconds: 3),() async{
    String userId =  await Prefrences().getUserId() ;
    if(userId!=""){
      fetchPatientDetails(userId);
      bool isPatient = await Prefrences().getIsPatient();
      if(isPatient==true){
        Get.offAll(()=>UserApplicationView());
      }else{
        // navigate it to the DoctorsView
        // implement logic to fetch pateint data and navigate
      }
    }else{
      Get.offAll(()=>OnbordingScreen());
    }
    },
    );
  }



  // function to fetch Patients details


  Future<void> fetchPatientDetails(String id) async{
    try {
      final response = await http.get(Uri.parse('${AppConstants.baseUrl}/getpatient/${id}'),
        headers: {"Content-Type": "application/json"},
      );
      if(response.statusCode==200){
        var data = jsonDecode(response.body);
        // user details fetched, now storing data in constants
        AppConstants.userId = data['_id'];
        AppConstants.userName = data['username'];;
        AppConstants.userEmail = data['email'];
        AppConstants.wallAmount = double.parse((data['__v']).toString());
        Prefrences().saveUserId(AppConstants.userId);
        Prefrences().setIsPatient(true);
      }else{

        throw("Error while fetching data");
      }
    }on InternetException {

      Snackbar.showSnackBar("No Internet Access", Icons.error_outline);
    }
    on TimeoutException {

      Snackbar.showSnackBar("Connection Timeout", Icons.error_outline);
    }on ServerException {

      Snackbar.showSnackBar("Internal Server Error", Icons.error_outline);
    }
    catch(e){

      Snackbar.showSnackBar("$e", Icons.error_outline);
    }
  }
}
