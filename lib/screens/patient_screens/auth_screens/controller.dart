import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/patient_screens/auth_screens/state.dart';
import 'package:http/http.dart' as http;

class TabViewController extends GetxController{
  final state = TabViewState();

  Future<void> signUpWithEmailPassword() async {
    print(state.signUpNameCont.text.toString().trim(),);
    print(state.signUpEmailCont.text.toString().trim(),);
    print(state.signUpPassCont.text.toString().trim(),);
    print(AppConstants.baseUrl);
    try {
      final response = await http.post(Uri.parse('https://imdfx-newserver-production.up.railway.app/api/signup'),
          body: {
            "username":"John DDoe",
            "email":"jdemo0@gmail.com",
            "password":"123456"
          }
      );
      var data = jsonDecode(response.body);
      print(data);
      if(response.statusCode==200){
        print("Data after signUp is $data");
      }else{
       Snackbar.showSnackBar("Error while sign up", Icons.error_outline);
      }
    }catch(e){
      Snackbar.showSnackBar("Exception $e", Icons.error_outline);
    }
    }



}