import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/helpers/shared_prefrences.dart';
import 'package:imedics_latest/screens/patient_screens/auth_screens/state.dart';
import 'package:http/http.dart' as http;
import 'package:imedics_latest/utils/app_exception.dart';
import 'package:imedics_latest/utils/app_text.dart';

class TabViewController extends GetxController{
  final state = TabViewState();


  setLoading (bool val){
    state.loading.value = val;
  }




  Future<void> signUpWithEmailPassword() async {
    setLoading(true);
    try {
      final response = await http.post(Uri.parse('${AppConstants.baseUrl}/signup'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "username":state.signUpNameCont.text.toString().trim(),
            "email":state.signUpEmailCont.text.toString().trim(),
            "password":state.signUpPassCont.text.toString().trim(),
          }),
      );
      if(response.statusCode==200){
        var data = jsonDecode(response.body);
        print("Patients signup data $data");
        Snackbar.showSnackBar("Account create successfully", Icons.done);
        // user signed up, handle logic to fetch details
        await loginWithEmailPass(
            state.signUpEmailCont.text.toString().trim(),
            state.signUpPassCont.text.toString().trim()
        );
      }else if(response.statusCode==400){
        setLoading(false);
        Snackbar.showSnackBar("User already exists", Icons.error_outline);
      }else{
        setLoading(false);
        throw("Error while sign-up");
      }
    }on InternetException {
      setLoading(false);
      Snackbar.showSnackBar("No Internet Access", Icons.error_outline);
    }
    on TimeoutException {
      setLoading(false);
      Snackbar.showSnackBar("Connection Timeout", Icons.error_outline);
    }on ServerException {
      setLoading(false);
      Snackbar.showSnackBar("Internal Server Error", Icons.error_outline);
    }
    catch(e){
      setLoading(false);
      Snackbar.showSnackBar("$e", Icons.error_outline);
    }
}


Future<void> loginWithEmailPass(String email,String pass) async{
  setLoading(true);
  try {
    final response = await http.post(Uri.parse('${AppConstants.baseUrl}/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email":email,
        "password":pass,
      }),
    );
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      print("Patients login data $data");
      // user logged-in and id Fetched, handle logic to fetch details
      await fetchPatientDetails(data.toString());
    }else if(response.statusCode==401){
      setLoading(false);
      Snackbar.showSnackBar("Invalid password", Icons.error_outline);
    }else if(response.statusCode==404){
      setLoading(false);
      Snackbar.showSnackBar("User not found", Icons.error_outline);
    }
    else{
      setLoading(false);
      throw("Error while Login");
    }
  }on InternetException {
    setLoading(false);
    Snackbar.showSnackBar("No Internet Access", Icons.error_outline);
  }
  on TimeoutException {
    setLoading(false);
    Snackbar.showSnackBar("Connection Timeout", Icons.error_outline);
  }on ServerException {
    setLoading(false);
    Snackbar.showSnackBar("Internal Server Error", Icons.error_outline);
  }
  catch(e){
    setLoading(false);
    Snackbar.showSnackBar("$e", Icons.error_outline);
  }
}



Future<void> fetchPatientDetails(String id) async{
    try {
      final response = await http.get(Uri.parse('${AppConstants.baseUrl}/getpatient/${id}'),
        headers: {"Content-Type": "application/json"},
      );
      if(response.statusCode==200){
        var data = jsonDecode(response.body);
        print("Patients details data $data");
        // user details fetched, now storing data in constants
        AppConstants.userId = data['_id'];
        AppConstants.userName = data['username'];;
        AppConstants.userEmail = data['email'];
        AppConstants.wallAmount = double.parse((data['__v']).toString());
        Prefrences().saveUserId(AppConstants.userId);
        Prefrences().setIsPatient(true);
        setLoading(false);
        clearControllers();


        //priting data for debuging purpose
        print("----Debuggin Print Statements------");
        print(AppConstants.userId + AppConstants.userName + AppConstants.userEmail + AppConstants.wallAmount.toString());
        print(await Prefrences().getUserId());
        print(await Prefrences().getIsPatient());


      }else{
        clearControllers();
        setLoading(false);
        throw("Error while fetching data");
      }
    }on InternetException {
      setLoading(false);
      Snackbar.showSnackBar("No Internet Access", Icons.error_outline);
    }
    on TimeoutException {
      setLoading(false);
      Snackbar.showSnackBar("Connection Timeout", Icons.error_outline);
    }on ServerException {
      setLoading(false);
      Snackbar.showSnackBar("Internal Server Error", Icons.error_outline);
    }
    catch(e){
      setLoading(false);
      Snackbar.showSnackBar("$e", Icons.error_outline);
    }
  }


  void clearControllers(){
    state.emailController.clear();
    state.passController.clear();
    state.signUpNameCont.clear();
    state.signUpEmailCont.clear();
    state.signUpPassCont.clear();
    state.loading.value=false;
    state.signUpisObscure.value=true;
    state.loginIsObscure.value=true;
  }


}