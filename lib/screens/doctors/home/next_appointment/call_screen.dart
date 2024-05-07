import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/end_call_dialogue.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/models/doctors/patient_model.dart';
import 'package:imedics_latest/screens/doctors/home/next_appointment/call_end_screen.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/waiting_room/call_end_screen.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class DoctorVideoCallScreen extends StatelessWidget {
  PatientAppointmentModel appoint;
  final PatientModel patientModel;
  DoctorVideoCallScreen({
    Key? key,
    required this.appoint, required this.patientModel,
  }) : super(key: key);
  // final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID:
      692080953, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
      "6b5f74cc7a4b660e5674d668aca949a6287ad3358f13c52a58083e76fce5fff5", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: '${AppConstants.docId}',
      userName: '${AppConstants.docName}',
      callID: "${appoint.sId}",
      events: ZegoUIKitPrebuiltCallEvents(
          onCallEnd: (
              ZegoCallEndEvent event,
              /// defaultAction to return to the previous page
              VoidCallback defaultAction,
              ) {
            // debugPrint('onCallEnd, do whatever you want');

            // navigate to done screen
            showEndCallDialogue(context, () {
              Get.to(()=>DoctorCallEndScreen(

                  patientModel:patientModel, appoint: appoint));
              // try {
              //   await FirebaseFirestore.instance
              //       .collection("calls")
              //       .doc(appoint.sId)
              //       .delete()
              //       .then((value) {
              //
              //   })
              //       .onError((error, stackTrace) {
              //     Snackbar.showSnackBar("Error $error", Icons.error_outline);
              //   });
              // } catch (e) {
              //   Snackbar.showSnackBar("Error $e", Icons.error_outline);
              // }
            },
            );


            // /// you can call this defaultAction to return to the previous page,
            // defaultAction.call();
          }
      ),
      // onDispose: () async {
      //   try {
      //     await FirebaseFirestore.instance
      //         .collection("calls")
      //         .doc(appoint.sId)
      //         .delete()
      //         .then((value) {
      //
      //     })
      //         .onError((error, stackTrace) {
      //       Snackbar.showSnackBar("Error $error", Icons.error_outline);
      //     });
      //   } catch (e) {
      //     Snackbar.showSnackBar("Error $e", Icons.error_outline);
      //   }
      // },
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
