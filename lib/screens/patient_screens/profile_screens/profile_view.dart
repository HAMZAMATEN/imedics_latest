import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/helpers/shared_prefrences.dart';
import 'package:imedics_latest/screens/common/accountType/view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: ElevatedButton(
            onPressed: (){
          AppConstants.clearUserValues();
          Prefrences().saveUserId("");
          Prefrences().setIsPatient(true);
          Get.offAll(()=>AccountTypeScreen());
        },
            child: Text("Log out")),
      )),
    );
  }
}
