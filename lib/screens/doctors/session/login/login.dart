// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/session/controller.dart';
import 'package:imedics_latest/screens/doctors/session/login/controller.dart';
import 'package:imedics_latest/screens/doctors/session/widgets/session_widgets.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class DoctorLoginView extends StatefulWidget {
  const DoctorLoginView({super.key, required this.isDoctor});

  final isDoctor;

  @override
  State<DoctorLoginView> createState() => _TabLoginState();
}

class _TabLoginState extends State<DoctorLoginView> {
  bool passObscure = true;
  final _formKey = GlobalKey<FormState>();

  final controller = Get.put(IndividualDoctorLoginController());

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              leadingIconPath: AppAssets.user,
              texfieldHeight: 60.h,
              controller: controller.state.loginEmailCon,
              hintText: 'Username or Email',
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              obscure: false,
              label: '',
              subTitle: '',
              validatorFn: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter an email address";
                } else if (!value.contains("@")) {
                  return "Invalid email address";
                }
                return null; // Return null if the validation passes.
              },
            ),
            padding10,
            Container(
              height: 60,
              margin: EdgeInsets.only(bottom: 5.h, top: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: AppColors.loginScreenTextColor.withOpacity(0.16),
                    width: 1.w),
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextFormField(
                controller: controller.state.loginPasswordCon,
                obscureText: passObscure,
                style: getMediumStyle(
                    fontSize: MyFonts.size16, color: AppColors.black),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 15, left: 20.w),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        passObscure = !passObscure;
                      });
                    },
                    child: Icon(
                      passObscure ? Icons.visibility_off : Icons.visibility,
                      color: passObscure ? Colors.grey : Colors.black,
                    ),
                  ),
                  prefixIcon: Icon(Icons.key),
                  errorStyle: getRegularStyle(
                      fontSize: MyFonts.size10,
                      color: Theme.of(context).colorScheme.error),
                  hintText: ' password',
                  hintStyle: getSemiBoldStyle(
                      fontSize: MyFonts.size16, color: AppColors.grey),
                  border: InputBorder.none,
                ),
                onFieldSubmitted: (value) {},
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter an password";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters long";
                  }
                  return null;
                },
              ),
            ),
            padding10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      side: const BorderSide(color: AppColors.grey, width: 2),
                      checkColor: AppColors.white,
                      focusColor: Colors.white,
                      fillColor: value
                          ? MaterialStateProperty.all(AppColors.appColor)
                          : MaterialStateProperty.all(AppColors.white),
                      value: value,
                      onChanged: (val) {
                        setState(() {
                          value = val!;
                        });
                      },
                    ),
                    Text('Remember me',
                        style: getMediumStyle(
                            color: AppColors.grey, fontSize: MyFonts.size16)),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Text(forgorpassword,
                      style: getMediumStyle(
                          color: AppColors.appColor, fontSize: MyFonts.size16)),
                ),
              ],
            ),
            padding10,
            Obx(() => controller.state.loading.value == true
                ? ShowProgressIndicator()
                : CustomButton(
                    onPressed: () {
                      //controller.login(context);
                      // controller.doctorIndLogin();
                      // controller.userLogin();
                      // if (_formKey.currentState!.validate()) {
                      if (controller.state.loginEmailCon.text.isNotEmpty &&
                          controller.state.loginPasswordCon.text.isNotEmpty) {
                        if (widget.isDoctor == true) {
                          controller.loginWithEmailPass(
                              controller.state.loginEmailCon.text.trim(),
                              controller.state.loginPasswordCon.text);
                          // controller.doctorIndLogin(context);
                          // TODO:: Doctor login logic goes here
                        } else {
                          // Navigator.pushNamed(context, AppRoutes.userMainMenuScreen);
                        }
                      } else {
                        Snackbar.showSnackBar(
                            'All fields must be filled', Icons.error_outline);
                      }
                    },
                    buttonText: login,
                    fontSize: 18,
                    borderRadius: 100.r,
                    backColor: AppColors.appColor,
                  )),
            Column(
              children: [
                padding16,
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 1.5.h,
                      color: AppColors.lightgrey,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or Continue With',
                        style: getMediumStyle(
                            color: AppColors.grey, fontSize: MyFonts.size14),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 1.5.h,
                      color: AppColors.lightgrey,
                    )),
                  ],
                ),
                padding20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    socialButtonCardWIdget(
                      onTap: () {
                        controller.faceBookLogin();
                      },
                      image: AppAssets.facebook,
                      text: facebook,
                    ),
                    socialButtonCardWIdget(
                      // isloading: controller.isLoading.value = true,
                      onTap: () {
                        controller.userGoogleSigIn(context);
                      },
                      image: AppAssets.google,
                      text: google,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
