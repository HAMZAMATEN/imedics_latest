import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/patient_screens/home/state.dart';
import 'package:http/http.dart' as http;
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';

class UserHomeController extends GetxController {
  final state = UserHomeState();

  setFetchAppointmentLoading(bool val){
    state.appointmentFetchLoading.value=val;
  }
  Future<void> fetchPatientAppointments() async{
    setFetchAppointmentLoading(true);
   try{
     var response = await http.get(Uri.parse("${AppConstants.baseUrl}/getbookappointment/662798168f105ba43d99a6f8"),);
     var items = jsonDecode(response.body);
     print("Response form hitting appointment $items");
     if(response.statusCode==200){
       state.patientAppointmentList = items.map<PatientAppointmentModel>((json) {
         return PatientAppointmentModel.fromJson(json);
       }).toList();
       setFetchAppointmentLoading(false);
     }
     if(response.statusCode==404){
       state.patientAppointmentList=[];
       setFetchAppointmentLoading(false);
     }

   }
   catch(e){
     setFetchAppointmentLoading(false);
     print("Exception is $e");
     Snackbar.showSnackBar("Error fetching data", Icons.error_outline);
   }




  }
  
  
}