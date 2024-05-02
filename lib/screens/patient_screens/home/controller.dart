import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/patient_screens/home/state.dart';
import 'package:http/http.dart' as http;
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';

class UserHomeController extends GetxController {
  final state = UserHomeState();




  // code for appointments

  setFetchAppointmentLoading(bool val){
    state.appointmentFetchLoading.value=val;
  }
  Future<void> fetchPatientAppointments() async{
    List<PatientAppointmentModel> filteredAppointments = [];
    setFetchAppointmentLoading(true);

   try{
     var response = await http.get(Uri.parse("${AppConstants.baseUrl}/getallbookappointment"),);
     var items = jsonDecode(response.body);


     if(response.statusCode==200){
       List<PatientAppointmentModel> appointments = items.map<PatientAppointmentModel>((json) {
         return PatientAppointmentModel.fromJson(json);
       }).toList();
       String desiredUserId = "${AppConstants.userId}";
       // String desiredUserId = "\"662798168f105ba43d99a6f8\"";

       // filtering appointments that have userId of current user
       for (PatientAppointmentModel appointment in appointments) {
         if (appointment.userId == desiredUserId) {
           if(checkAppointmentValidation(appointment.bookingDate!)){
             filteredAppointments.add(appointment);
           }
         }
       }
       //sorting in asceding order and storing in list to show
       filteredAppointments.sort((a, b) => a.selectedDate!.compareTo(b.selectedDate!));
       state.patientAppointmentList = filteredAppointments;

       // setFetchAppointmentLoading(false);

     }

     if(response.statusCode==404){
       state.patientAppointmentList=[];
       setFetchAppointmentLoading(false);
     }
   }
   catch(e){
     setFetchAppointmentLoading(false);
     Snackbar.showSnackBar("Error fetching data", Icons.error_outline);
   }

  }
  bool checkAppointmentValidation(String appDate){
    DateTime currentDate = DateTime.now();
    int currDay = currentDate.day;
    int currMonth = currentDate.month;
    int currYear = currentDate.year;

    List<String> components = appDate.split('-');
    int year = int.parse(components[0]);
    int month = int.parse(components[1]);
    int day = int.parse(components[2]);

    if(currDay<=day &&
        currMonth<=month &&
        currYear <= year
    ){
      return true;
    }else{
      return false;
    }
  }

      // fetching single doctor details
  Future<void> fetchDocDetails(String docId) async{
    try{
      http.Response response = await http.get(Uri.parse("${AppConstants.baseUrl}/getDoctorDetail/${docId}"));
      var items = jsonDecode(response.body);
      if(response.statusCode==200){

        state.appointMentDoc = UserDocModel.fromJson(jsonDecode(response.body));
        setFetchAppointmentLoading(false);
      }
      if(response.statusCode==404){
        Snackbar.showSnackBar("Error while fetching doctors details", Icons.error_outline);
        // state.doctorsList = [];
        setFetchAppointmentLoading(false);

      }
    }catch(e){
      Snackbar.showSnackBar("Error: $e", Icons.error_outline);
      setFetchAppointmentLoading(false);

    }
  }



  // code for fetching all doctors
  setFetchDocLoading(bool val){
    state.docListFetchLoading.value=val;
  }
    Future<void> fetchAllDoctors() async{
    setFetchDocLoading(true);
    try{
      http.Response response = await http.get(Uri.parse("${AppConstants.baseUrl}/doctorpersnoldetails"));
      var items = jsonDecode(response.body);
      if(response.statusCode==200){
        List<UserDocModel> listOfDocs = items.map<UserDocModel>((json) {
          return UserDocModel.fromJson(json);
        }).toList();
        state.doctorsList=listOfDocs;
        setFetchDocLoading(false);
      }
      if(response.statusCode==404){
        Snackbar.showSnackBar("Error while fetching doctors list", Icons.error_outline);
        state.doctorsList = [];
        setFetchDocLoading(false);
      }
    }catch(e){
      setFetchDocLoading(false);
      Snackbar.showSnackBar("Error: $e", Icons.error_outline);
    }
    }



}