import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/components/try_again_dialogue_box.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/helpers/notification_services.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/checkOutWidgets/payment_successfull.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/state.dart';
import 'package:imedics_latest/screens/patient_screens/applicationScreens/view.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/appoint_book_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:http/http.dart' as http;

class SetAppointmentDetailsController extends GetxController {
  final state = SetAppointementDetailsState();

  void setTimeValueToFalse() {
    state.Am9.value = false;
    state.Am10.value = false;
    state.Am11.value = false;
    state.Am12.value = false;
    state.pm01.value = false;
    state.pm02.value = false;
    state.pm03.value = false;
    state.pm04.value = false;
  }

  void setTimeValueToTrue(bool val) {
    setTimeValueToFalse();
    val = true;
  }

  String getDayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'Invalid weekday';
    }
  }

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'Invalid month';
    }
  }

  setCurrentDateTimeValues() {
    state.time.value = "09:00 AM";
    state.Am9.value = true;
    DateTime date = DateTime.now();
    state.year.value = date.year.toString();
    state.month.value = date.month.toString();
    state.date.value = date.day.toString();
    state.weekDay.value = getDayName(date.weekday);
    state.monthName.value = getMonthName(date.month);
  }


  //Loading is missing here
  Future<void> bookAppointment(BuildContext context,
      UserDocModel doctor, SetAppointmentDetailsController controller) async {
    String? useriD = AppConstants.userId;
    DateTime now = DateTime.now();

// If you only want the date part (with the time set to 00:00:00)
    DateTime currentDate = DateTime(now.year, now.month, now.day);

// Storing the date in a variable (as a String for display purposes, for example)
    String formattedDate =
        "${currentDate.year}-${currentDate.month}-${currentDate.day}";

    final doctorId = doctor.sId!;
    UserBookAppointmentModel bookAppointmentModel = UserBookAppointmentModel(
        bookingType: controller.state.bookingFor.value,
        gender: controller.state.gender.value,
        patientAge: controller.state.age.value,
        expiryYear: controller.state.yearCont.text.toString(),
        expiryMonth: controller.state.monthCont.text.toString(),
        Details: controller.state.detailsController.text.toLowerCase(),
        cvv: controller.state.cvvCont.text.toString(),
        cardNumber: controller.state.cardNumCont.text.toString(),
        cardName: controller.state.accTitleCont.text.toString(),
        cardType: "Debit Card(Stripe)",
        selectedDate:
            '${controller.state.year.value}-${controller.state.month.value}-${controller.state.date.value}',
        selectedTimeSlot: '${controller.state.time.value}',
        docId: doctorId,
        bookingDate: formattedDate,
        userId: useriD.toString());

    try {
      http.Response response = await http.post(
        Uri.parse("${AppConstants.baseUrl}/bookappointment"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(bookAppointmentModel.toJson()),
      );

      if(response.statusCode==200){
        Snackbar.showSnackBar("Booked Successfully", Icons.done);
        //Wrtie code to implement notification
        String docToken  = await fetchDocToken(doctor.sId!);
        NotificationServices().sendNotification("Booking Alert", "${AppConstants.userName} booked appointment with you", docToken, "Notification alert sent to doctor");
        Get.off(()=>PaymentSuccessfullWidget(appController: controller,));
      }else{
        Snackbar.showSnackBar("Error: Unable to book appointment\nTry again later!", Icons.error_outline);
        showTryAgainDialogue(context, () {
          Get.offAll(()=>UserApplicationView());
        });
        // Get.offAll(()=>UserApplicationView());
      }
    } catch (e) {
      Snackbar.showSnackBar("Error: $e", Icons.error_outline);
      // print("Exception is $e");
      showTryAgainDialogue(context, () {
        Get.offAll(()=>UserApplicationView());
      });
      // Get.offAll(()=>UserApplicationView());
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
