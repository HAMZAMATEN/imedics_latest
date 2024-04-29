import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TabViewState {
  //Login Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  //Signup Controllers
  TextEditingController signUpNameCont = TextEditingController();
  TextEditingController signUpEmailCont = TextEditingController();
  TextEditingController signUpPassCont = TextEditingController();

  //Variables
  RxBool signUpisObscure = true.obs;
  RxBool loginIsObscure = true.obs;
  RxBool loading = false.obs;
}