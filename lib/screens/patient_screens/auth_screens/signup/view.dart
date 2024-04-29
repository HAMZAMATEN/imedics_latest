

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/common_password_text_fields.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/auth_screens/controller.dart';
import 'package:imedics_latest/screens/patient_screens/auth_screens/login/widgets/loginBottomWidget.dart';
import 'package:imedics_latest/screens/patient_screens/auth_screens/login/widgets/socialButtonWidget.dart';
import 'package:imedics_latest/screens/patient_screens/auth_screens/signup/widgets/justJoinWidget.dart';
import 'package:imedics_latest/screens/patient_screens/auth_screens/tab_view.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class UserSignUpScreen extends StatefulWidget {
  TabViewController controller = TabViewController();
   UserSignUpScreen({super.key,required this.controller});

  @override
  State<UserSignUpScreen> createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  bool termsAndConditions = false;
  bool passObscure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 6.h),
            child: Column(
              children: [
                padding10,
                TextFormField(
                  controller: widget.controller.state.signUpNameCont,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.person_outline),
                    hintText: "Name",
                    hintStyle: getLightStyle(color: Colors.black26),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )
                    )
                  ),
                ),
                padding8,
                TextFormField(
                  controller: widget.controller.state.signUpEmailCont,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: "Email",
                      hintStyle: getLightStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      )
                  ),
                ),
                padding8,
                Obx(() =>TextFormField(
                  controller: widget.controller.state.signUpPassCont,
                  maxLength: 6,
                  obscureText:  widget.controller.state.signUpisObscure.value,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Password",
                      prefixIcon: Icon(Icons.key),
                      suffixIcon: IconButton(onPressed: (){
                        widget.controller.state.signUpisObscure.value = !widget.controller.state.signUpisObscure.value;
                      }, icon: widget.controller.state.signUpisObscure.value?Icon(Icons.visibility_off_outlined,color: Colors.grey,):Icon(Icons.visibility,color: Colors.grey,)
                      ),
                      hintStyle: getLightStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      )
                  ),
                )),
                padding10,
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          termsAndConditions = !termsAndConditions;
                        });
                      },
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: termsAndConditions
                            ? AppColors.appColor
                            : AppColors.loginScreenTextColor,
                      ),
                    ),
                    padding10,
                    Flexible(
                      child: Text(
                        agreeTo,
                        style: getRegularStyle(
                            color: AppColors.loginScreenTextColor,
                            fontSize: MyFonts.size12),
                      ),
                    ),
                  ],
                ),
                padding45,
                Obx(() =>Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: widget.controller.state.loading.value==true?ShowProgressIndicator():CustomButton(
                    onPressed: () {
                      if(widget.controller.state.signUpNameCont.text.isEmpty ||
                          widget.controller.state.signUpEmailCont.text.isEmpty ||
                          widget.controller.state.signUpPassCont.text.isEmpty
                      ){
                        Snackbar.showSnackBar("Enter all fields", Icons.error_outline_outlined);
                      }else {
                        if(termsAndConditions == false){
                          Snackbar.showSnackBar("Check Terms of Services", Icons.error_outline_outlined);
                        }else
                        if(widget.controller.state.signUpPassCont.text.length<6){
                          // implement logic ,after all fields are entered
                          Snackbar.showSnackBar("Minimum password length is 6 characters", Icons.error_outline_outlined);
                        }else{
                          widget.controller.signUpWithEmailPassword();

                        }

                      }

                      // widget.controller.signUpWithEmailPassword();
                    },
                    buttonText: signup,
                    fontSize: MyFonts.size18,
                    borderRadius: 12.r,
                    backColor: AppColors.appColor,
                  ),
                )),
                padding12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      haveAccount,
                      style: getRegularStyle(
                          color: AppColors.loginScreenTextColor,
                          fontSize: MyFonts.size14),
                    ),
                    padding5,
                    InkWell(
                      onTap: () {
                        Get.offAll(()=>AuthTabView());
                      },
                      child: Text(
                        login,
                        style: getRegularStyle(
                            color: AppColors.appColor,
                            fontSize: MyFonts.size14),
                      ),
                    ),
                    padding18,

                  ],
                ),
                padding8,
                Text("Or Continue with",style: getRegularStyle(color: Colors.black26),),
                padding8,
                // padding16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.r),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppAssets.facebook,height: 30.h,width:30.w,),
                              SizedBox(width: 3,),
                              Text("Facebook",style: getRegularStyle(color: Colors.black),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.r),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppAssets.google,height: 30.h,width:30.w,),
                              SizedBox(width: 3,),
                              Text("Google",style: getRegularStyle(color: Colors.black),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
