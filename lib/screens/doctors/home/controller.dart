import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/helpers/notification_services.dart';
import 'package:imedics_latest/models/doctors/patient_model.dart';
import 'package:imedics_latest/screens/doctors/home/next_appointment/call_screen.dart';
import 'package:imedics_latest/screens/doctors/home/state.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/waiting_room/call_view.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/call_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:http/http.dart' as http;
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:intl/intl.dart';

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

  setFetchAppointmentLoading(bool val) {
    state.appointmentFetchLoading.value = val;
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
      if (response.statusCode == 200) {
        List<PatientAppointmentModel> appointments =
            items.map<PatientAppointmentModel>((json) {
          return PatientAppointmentModel.fromJson(json);
        }).toList();
        var docId = AppConstants.docId;
        log('docId:$docId');
        log('len:${appointments.length}');
        for (var appointment in appointments) {
          if (appointment.docId == docId) {
            if (checkAppointmentValidation(appointment.selectedDate!)) {
              log('exist');
              filteredAppointments.add(appointment);
            } else {
              log('not eee');
              filteredCompletedAppointments.add(appointment);
            }
          } else {
            log('not');
          }
        }

        filteredAppointments
            .sort((a, b) => a.selectedDate!.compareTo(b.selectedDate!));
        state.patientAppointmentList = filteredAppointments;
        state.completedAppointmentList = filteredCompletedAppointments;
        if (state.patientAppointmentList.isNotEmpty) {
          log('not');
          fetchPatientDetails(state.patientAppointmentList[0].userId!);
        } else {
          log('empty');
          setFetchAppointmentLoading(false);
        }
      } else {
        log('st:${response.statusCode}');
      }
    } catch (e) {}
  }

  bool checkAppointmentValidation(String appDate) {
    DateTime currentDate = DateTime.now();
    int currDay = currentDate.day;
    int currMonth = currentDate.month;
    int currYear = currentDate.year;

    List<String> components = appDate.split('-');
    int year = int.parse(components[0]);
    int month = int.parse(components[1]);
    int day = int.parse(components[2]);

    if (currDay <= day && currMonth <= month && currYear <= year) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> fetchPatientDetails(String userId) async {
    log('uId:$userId');
    try {
      http.Response response = await http
          .get(Uri.parse("${AppConstants.baseUrl}/getpatient/${userId}"));
      var items = jsonDecode(response.body);
      log('item:$items');
      if (response.statusCode == 200) {
        state.patientModel = PatientModel.fromJson(jsonDecode(response.body));
        setFetchAppointmentLoading(false);
        log('data:${state.patientModel.username}');
      }
      if (response.statusCode == 404) {
        Snackbar.showSnackBar(
            "Error while fetching doctors details", Icons.error_outline);
        // state.doctorsList = [];
        setFetchAppointmentLoading(false);
      }
    } catch (e) {
      Snackbar.showSnackBar("Error: $e", Icons.error_outline);
      setFetchAppointmentLoading(false);
    }
  }

  Future<PatientModel> fetchParticularPatientDetails(String userId) async {
    http.Response response = await http
        .get(Uri.parse("${AppConstants.baseUrl}/getpatient/${userId}"));
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

  bool checkWaitingRoom(PatientAppointmentModel appoint) {
    // String date = appoint.selectedDate!;
    // String time = appoint.selectedTimeSlot!;
    //
    String date = "2024-5-7";
    String time = "08:00 PM";

    // print(date);
    // String date = "2024-5-6";

    if (compareDateWithString(date)) {
      // print("Comparisoin");
      // print(compareDateWithString(date));

      int hour = extractHourFromString(time);
      bool isAm = time.contains("AM");
      if (isAm) {
        // print("IS AM");
      } else {
        // print( "is pm");
        hour = hour + 12;
        // print(hour);
      }
      // 18 current hour
      int currentHour = DateTime.now().hour;


      // print("Current hour is $currentHour");
      if (hour == currentHour || hour == currentHour - 1) {
        // print("hour==currentHour || hour==currentHour-1");
        // print(hour==currentHour);
        // print(hour==currentHour-1);
        return true;
      } else {
        // print("hour==currentHour && hour==currentHour-1");
        return false;
      }
    } else {
      return false;
    }

    //"10:00 AM"
  }

  bool compareDateWithString(String dateString) {
    // Parse the database date string
    List<String> parts = dateString.split("-");
    int year = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int day = int.parse(parts[2]);

    DateTime dbDate = DateTime(year, month, day);

    // Get the current date
    DateTime currentDate = DateTime.now();

    // Compare the database date with the current date
    return dbDate.year == currentDate.year &&
        dbDate.month == currentDate.month &&
        dbDate.day == currentDate.day;
  }

  Future<void> DoctorCheckAndJoinCall(
      PatientAppointmentModel appoint, PatientModel patientModel) async {
    try {
      String patientToken = await fetchPatientToken(patientModel.sId!);
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection("calls")
          .doc("${appoint.sId}")
          .get();

      if (doc.exists) {
        NotificationServices().sendNotification("Video Call started", "Doctor ${AppConstants.docName} joined video call", patientToken, "Patient informed and will join shortly");
        // NotificationServices().sendNotification(title, Notificbody, token, snackbarMsg)
        Get.to(() => DoctorVideoCallScreen(
            appoint: appoint, patientModel: patientModel));
        // send notification and navigate to call screen
      } else {
        CallModel callModel = CallModel(
            appointmentId: appoint.sId,
            doctorId: appoint.docId,
            userId: appoint.userId);

        FirebaseFirestore.instance
            .collection("calls")
            .doc("${appoint.sId}")
            .set(callModel.toJson())
            .then((value) {
          NotificationServices().sendNotification(
              "Video Call started",
              "Doctor ${AppConstants.docName} joined video call",
              patientToken,
              "Patient informed and will join shortly");
          Get.to(() => DoctorVideoCallScreen(
              appoint: appoint, patientModel: patientModel));
          // Navigate to call screen and send notifcation
          Snackbar.showSnackBar("Doctor will be with you soon", Icons.alarm);
        }).onError((error, stackTrace) {
          Snackbar.showSnackBar("Error $error", Icons.error_outline);
        });
      }
    } catch (e) {
      Snackbar.showSnackBar("Error $e", Icons.error_outline);
    }
  }

  int extractHourFromString(String timeString) {
    // Split the string based on the ":" delimiter
    List<String> parts = timeString.split(":");

    // Extract the hour part (first part after splitting)
    int hour = int.parse(parts[0]);

    return hour;
  }

  Future<String> fetchPatientToken(String patientId) async {
    print("DOC id is $patientId");
    String token = "";
    try {
      DocumentSnapshot document = await FirebaseFirestore.instance
          .collection("users")
          .doc(patientId)
          .get();
      if (document.exists) {
        token = document["pushToken"];
      }
      print("TOken fetched");
      print(token);
    } catch (e) {
      Snackbar.showSnackBar("Error $e", Icons.error_outline);
    }
    return token;
  }
}
