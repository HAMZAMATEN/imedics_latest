import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefrences {
  Future<void> saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', userId);
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  Future<void> removeUserId(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
    // Navigator.push(
    //     context, MaterialPageRoute(builder: ((context) => SplashScreen())));
  }

  Future<void> saveUserindex(String userIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_index', userIndex);
  }

  Future<String?> getUserindex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_index');
  }

  Future<void> setIsPatient(bool isPatient) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isPatient', isPatient);
  }

  Future<bool> getIsPatient() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isPatient') ?? true;
  }

}
