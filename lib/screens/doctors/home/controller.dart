import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/models/doctors/patient_model.dart';
import 'package:imedics_latest/screens/doctors/home/state.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:http/http.dart' as http;
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';

class DoctorHomeController extends GetxController {
  final state = DoctorHomeState();

  // setFetchAppointmentLoading(bool val){
  //   state.appointmentFetchLoading.value=val;
  // }
  // Future<void> fetchPatientAppointments() async{
  //   List<PatientAppointmentModel> filteredAppointments = [];
  //   setFetchAppointmentLoading(true);
  //   print("Function called");
  //
  //   try{
  //     var response = await http.get(Uri.parse("${AppConstants.baseUrl}/getallbookappointment"),);
  //     var items = jsonDecode(response.body);
  //     // log('items:$items');
  //
  //     if(response.statusCode==200){
  //       print("Status code is 200");
  //       List<PatientAppointmentModel> appointments = items.map<PatientAppointmentModel>((json) {
  //         return PatientAppointmentModel.fromJson(json);
  //       }).toList();
  //       print("Doc id is ${AppConstants.docId}");
  //       String desiredocId = "${AppConstants.docId}";
  //       // String desiredUserId = "\"662798168f105ba43d99a6f8\"";
  //
  //       // filtering appointments that have userId of current user
  //       for (PatientAppointmentModel appointment in appointments) {
  //         // print("Iteration in fetch appointment");
  //         // state.completedAppointmentList = [];
  //         if (appointment.docId == desiredocId) {
  //           log('docId:${appointment.docId}');
  //           log('desired:${desiredocId}');
  //           if(checkAppointmentValidation(appointment.bookingDate!)){
  //             log('inside1');
  //
  //             // logic for appointments of current day and days after current day
  //             filteredAppointments.add(appointment);
  //           }else{
  //             // logic for appointments passed current date
  //             state.completedAppointmentList.add(appointment);
  //             log('len:${state.completedAppointmentList.length}');
  //           }
  //         }
  //       }
  //       //sorting in asceding order and storing in list to show
  //       filteredAppointments.sort((a, b) => a.selectedDate!.compareTo(b.selectedDate!));
  //       state.patientAppointmentList = filteredAppointments;
  //       if(state.patientAppointmentList.length>0){
  //         log('data');
  //         fetchPatientDetails(state.patientAppointmentList[0].userId!);
  //       }else{
  //         setFetchAppointmentLoading(false);
  //       }
  //
  //       // setFetchAppointmentLoading(false);
  //
  //     }
  //
  //     if(response.statusCode==404){
  //       print("Status code is 404");
  //       state.patientAppointmentList=[];
  //       setFetchAppointmentLoading(false);
  //     }
  //   }
  //   catch(e){
  //     print("Error while fetching");
  //     setFetchAppointmentLoading(false);
  //     Snackbar.showSnackBar("Error fetching data", Icons.error_outline);
  //   }
  //
  // }
  // bool checkAppointmentValidation(String appDate){
  //   DateTime currentDate = DateTime.now();
  //   int currDay = currentDate.day;
  //   int currMonth = currentDate.month;
  //   int currYear = currentDate.year;
  //
  //   List<String> components = appDate.split('-');
  //   int year = int.parse(components[0]);
  //   int month = int.parse(components[1]);
  //   int day = int.parse(components[2]);
  //
  //   if(currDay<=day &&
  //       currMonth<=month &&
  //       currYear <= year
  //   ){
  //     return true;
  //   }else{
  //     return false;
  //   }
  // }
  //
  // // fetching single doctor details
  // Future<void> fetchPatientDetails(String docId) async{
  //   try{
  //     http.Response response = await http.get(Uri.parse("${AppConstants.baseUrl}/getDoctorDetail/${docId}"));
  //     var items = jsonDecode(response.body);
  //     if(response.statusCode==200){
  //
  //       state.appointMentDoc = UserDocModel.fromJson(jsonDecode(response.body));
  //       setFetchAppointmentLoading(false);
  //     }
  //     if(response.statusCode==404){
  //       Snackbar.showSnackBar("Error while fetching doctors details", Icons.error_outline);
  //       // state.doctorsList = [];
  //       setFetchAppointmentLoading(false);
  //
  //     }
  //   }catch(e){
  //     Snackbar.showSnackBar("Error: $e", Icons.error_outline);
  //     setFetchAppointmentLoading(false);
  //
  //   }
  // }
  //
  //
  //
  // // code for fetching all doctors
  // setFetchDocLoading(bool val){
  //   state.docListFetchLoading.value=val;
  // }
  // Future<void> fetchAllDoctors() async{
  //   setFetchDocLoading(true);
  //   try{
  //     http.Response response = await http.get(Uri.parse("${AppConstants.baseUrl}/doctorpersnoldetails"));
  //     var items = jsonDecode(response.body);
  //     if(response.statusCode==200){
  //       List<UserDocModel> listOfDocs = items.map<UserDocModel>((json) {
  //         return UserDocModel.fromJson(json);
  //       }).toList();
  //       state.doctorsList=listOfDocs;
  //       setFetchDocLoading(false);
  //     }
  //     if(response.statusCode==404){
  //       Snackbar.showSnackBar("Error while fetching doctors list", Icons.error_outline);
  //       state.doctorsList = [];
  //       setFetchDocLoading(false);
  //     }
  //   }catch(e){
  //     setFetchDocLoading(false);
  //     Snackbar.showSnackBar("Error: $e", Icons.error_outline);
  //   }
  // }

  setFetchAppointmentLoading(bool val){
    state.appointmentFetchLoading.value=val;
  }
  getDoctorAppointmentDetails() async {

    setFetchAppointmentLoading(true);
    List<PatientAppointmentModel> filteredAppointments = [];
    List<PatientAppointmentModel> filteredCompletedAppointments = [];


    try {
      var response = await http
          .get(Uri.parse("${AppConstants.baseUrl}/getallbookappointment"));
      var items = jsonDecode(response.body);
      // log('body:$items');
      if(response.statusCode == 200) {
        List<PatientAppointmentModel> appointments =
        items.map<PatientAppointmentModel>((json) {
          return PatientAppointmentModel.fromJson(json);
        }).toList();
        var docId = AppConstants.docId;
        log('docId:$docId');
        log('len:${appointments.length}');
        for(var appointment in appointments) {
          if(appointment.docId == docId){
            if(checkAppointmentValidation(appointment.bookingDate!)){
              log('exist');
              filteredAppointments.add(appointment);
            }else{
              log('not eee');
              filteredCompletedAppointments.add(appointment);
            }
          }else {
            log('not');
          }
        }

        filteredAppointments.sort((a, b) => a.selectedDate!.compareTo(b.selectedDate!));
        state.patientAppointmentList = filteredAppointments;
        state.completedAppointmentList = filteredCompletedAppointments;
        if(state.patientAppointmentList.isNotEmpty){
          log('not');
          fetchPatientDetails(state.patientAppointmentList[0].userId!);
        }else{
          log('empty');
          setFetchAppointmentLoading(false);

        }

      }else{
        log('st:${response.statusCode}');
      }
    } catch (e) {}
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


  Future<void> fetchPatientDetails(String userId) async{
    log('uId:$userId');
    try{
      http.Response response = await http.get(Uri.parse("${AppConstants.baseUrl}/getpatient/${userId}"));
      var items = jsonDecode(response.body);
      log('item:$items');
      if(response.statusCode==200){

        state.patientModel = PatientModel.fromJson(jsonDecode(response.body));
        setFetchAppointmentLoading(false);
        log('data:${state.patientModel.username}');
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
  Future<PatientModel> fetchParticularPatientDetails(String userId) async{

      http.Response response = await http.get(Uri.parse("${AppConstants.baseUrl}/getpatient/${userId}"));
      var items = jsonDecode(response.body);
      log('item:$items');

        return PatientModel.fromJson(jsonDecode(response.body));

  }



}
