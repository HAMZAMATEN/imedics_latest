import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class ZIMKiDoctorChatPage extends StatelessWidget {
  final PatientAppointmentModel patientAppointmentModel;
  const ZIMKiDoctorChatPage({Key? key, required this.patientAppointmentModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversations'),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.home))],
      ),
      body: ZIMKitConversationListView(
        onPressed: (context, conversation, defaultAction) {
          log('conver:${patientAppointmentModel.userId}');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ZIMKitMessageListPage(
                conversationID: patientAppointmentModel.sId.toString(),
                conversationType: ZIMConversationType.peer,
              );
            },
          ));
        },
      ),
    );
  }
}