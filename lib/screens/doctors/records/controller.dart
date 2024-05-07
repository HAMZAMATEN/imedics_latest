import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/models/doctors/patient_model.dart';
import 'package:imedics_latest/screens/doctors/records/state.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DoctorRecordController extends GetxController {
  final state = DoctorRecordState();



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
            if(checkAppointmentValidation(appointment.selectedDate!)){
              log('exist');
              log(appointment.bookingDate.toString());
              filteredAppointments.add(appointment);
            }else{

              log(appointment.bookingDate.toString());

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
      log('tr');
      log('cD:$currDay');
      log('cy:$currYear');
      log('cm:$currMonth');
      log('y:$year');
      log('d:$day');
      log('m:$month');
      return true;
    }else{
      log('fl');
      log('cD:$currDay');
      log('cy:$currYear');
      log('cm:$currMonth');
      log('y:$year');
      log('d:$day');
      log('m:$month');
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


  String convertDate(String inputDate) {
    // Split the input date string
    List<String> dateParts = inputDate.split('-');

    // Parse the date parts into integers
    int year = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);

    // Create a DateTime object
    DateTime dateTime = DateTime(year, month, day);

    // Create a DateFormat instance for the desired format
    DateFormat formatter = DateFormat('EEEE, MMMM dd yyyy');

    // Format the DateTime object to the desired format
    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }

  getFormatDate(date) {
    // 2022-10-17T13:34:01.000000Z
    int formattedDateTime = int.parse(date);
    DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(formattedDateTime);
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  }
}