import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/helpers/notification_services.dart';
import 'package:imedics_latest/screens/doctors/home/video_call_screen.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/state.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/waiting_room/call_view.dart';
import 'package:imedics_latest/screens/patient_screens/home/controller.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/call_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';

class AllAppointmentController extends GetxController {
  final state = AllAppointmentState();

  UserDocModel getUpComingAppointDoc(UserHomeController controller,
      String docId) {
    late UserDocModel appDoc;
    for (UserDocModel doc in controller.state.doctorsList) {
      if (doc.sId == docId) {
        appDoc = doc;
        print(appDoc);
      }
    }
    return appDoc;
  }

  void addImageToList(String image) {
    state.imageUrlsToShare.add(image);
  }

  void removeImageFromList(String image) {
    state.imageUrlsToShare.remove(image);
  }


  setUploadLoading(bool val) {
    state.uploadLoading.value = val;
  }

  Future<void> shareReport(String image, String docId, String appointId) async {
    String id = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    try {
      await FirebaseFirestore.instance.collection("reports").doc(id).set(
          {
            "id": id,
            "appointment_id": "663548adede96432c5409889",
            "doctor_id": "65b106e6878a225eb211b6d8",
            "user_id": "${AppConstants.userId}",
            "report_type": "MRI",
            "report_title": "Tumor",
            "report_image": "${image}",
          }).then((value) {}).onError((error, stackTrace) {
        // print(error);
        Snackbar.showSnackBar("Error : $error", Icons.done);
      });
    } catch (e) {
      // print(e);
      // print("Exveption is $e");
    }
  }


  Future<void> sendDataToFirebase(PatientAppointmentModel appoint) async {
    setUploadLoading(true);
    for (String imageUrl in state.imageUrlsToShare) {
      await shareReport(imageUrl, appoint.docId!, appoint.sId!);
    }
    setUploadLoading(false);
  }

  int extractHourFromString(String timeString) {
    // Split the string based on the ":" delimiter
    List<String> parts = timeString.split(":");

    // Extract the hour part (first part after splitting)
    int hour = int.parse(parts[0]);

    return hour;
  }


  void printHour() {
    int currentHour = DateTime
        .now()
        .hour;
    // print("HOur is $currentHour");
  }

  bool checkWaitingRoom(PatientAppointmentModel appoint) {
    // String date = appoint.selectedDate!;
    // String time = appoint.selectedTimeSlot!;
    //
    String date = "2024-5-7";
    String time = "00:00 AM";


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
      int currentHour = DateTime
          .now()
          .hour;

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


  Future<void> checkAndJoinCall(PatientAppointmentModel appoint,
      UserDocModel doctor) async {
    try {
      String docToken  = await fetchDocToken(doctor.sId!);
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection(
          "calls").doc("${appoint.sId}").get();

      if (doc.exists) {
        NotificationServices().sendNotification("Video Call started", "Patient ${AppConstants.userName} joined video call", docToken, "Doctor informed and will join shortly");
        Get.to(() => VideoCallScreen(appoint: appoint, doctor: doctor));
        // send notification and navigate to call screen
      } else {
        CallModel callModel = CallModel(
            appointmentId: appoint.sId,
            doctorId: appoint.docId,
            userId: appoint.userId);

        FirebaseFirestore.instance.collection("calls")
            .doc("${appoint.sId}")
            .set(callModel.toJson())
            .then((value) {
          NotificationServices().sendNotification("Video Call started" , "Patient ${AppConstants.userName} joined video call", docToken, "Doctor informed and will join shortly");
          Get.to(() => VideoCallScreen(appoint: appoint, doctor: doctor));
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

  
  Future<String> fetchDocToken(String docId) async{
    print("DOC id is $docId");
    String token= "";
    try{
      DocumentSnapshot document =  await FirebaseFirestore.instance.collection("doctors").doc(docId).get();
      if(document.exists){
        token = document["pushToken"];
      }
      print("TOken fetched");
      print(token);
    }catch(e){
      Snackbar.showSnackBar("Error $e", Icons.error_outline);
    }
    return token;
  }


}