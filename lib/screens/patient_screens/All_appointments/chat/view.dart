import 'package:flutter/material.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class ZIMKitDemoHomePage extends StatelessWidget {
  PatientAppointmentModel appointment;
  ZIMKitDemoHomePage({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Conversations'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.home))],
        ),
        body: SafeArea(
          child: ZIMKitConversationListView(
            itemBuilder: (context,conversation,child){
              print("-------------");
              print(conversation.id);
              return ListTile(
                title: Text(conversation.name.toString()),
              );
            },
            onPressed: (context, conversation, defaultAction) {
              print("Inside converstioa");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ZIMKitMessageListPage(
                      conversationID: appointment.docId!,
                      conversationType: ZIMConversationType.peer,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
