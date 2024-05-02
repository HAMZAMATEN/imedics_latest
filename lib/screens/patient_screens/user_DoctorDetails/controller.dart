import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:imedics_latest/utils/app_exception.dart';
class UserDoctorDetailController extends GetxController{


  Future<void> fetchSingleDocDetails() async {
    // loading.value=true;
    try{
      final response  = await http.get(Uri.parse("${AppConstants.baseUrl}getDoctorDetail/${AppConstants.userId}"));
      final data = jsonDecode(response.body);
      // docDetails = SingleDocDetailsModel.fromJson(data);
      // loading.value=false;
    } on InternetException{
      // loading.value=false;
      Snackbar.showSnackBar("Check Internet Connection", Icons.error_outline);
    }catch(e){
      // loading.value=false;
      Snackbar.showSnackBar("Error : $e", Icons.error_outline);
    }
  }

  // Future<void> fetchDocFee(String docId) async{
  //   try{
  //     final response =
  //     await http.get(Uri.parse('${AppConstants.baseUrl}/getDoctorDetail/$docId'));
  //     if(response.statusCode==200){
  //       var oncelist = (jsonDecode(response.body))['once'];
  //       for (var item in oncelist!) {
  //         String consultationFees = item['consultationfees'];
  //         AppConstants.consultationFee = consultationFees;
  //       }
  //     }
  //
  //   }catch(e){
  //
  //   }
  // }


}