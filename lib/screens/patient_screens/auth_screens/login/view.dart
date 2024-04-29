import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_field.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/auth_screens/controller.dart';
import 'package:imedics_latest/screens/patient_screens/auth_screens/login/widgets/loginBottomWidget.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class LoginTab extends StatefulWidget {
  TabViewController controller;
  LoginTab({super.key, required this.controller});

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  bool passObscure = true;
  bool isLoading = false;
  bool value = false;

  final key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  leadingIconPath: AppAssets.user,
                  texfieldHeight: 60.h,
                  controller: widget.controller.state.emailController,
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
                AppTextField(
                  leadingIconPath: AppAssets.key,
                  // tailingIcon: Icon(Icons.visibility_off,color: Colors.black54,),
                  trailingIconPath: AppAssets.eye,
                  suffixTap: () {},
                  texfieldHeight: 60.h,
                  controller: widget.controller.state.passController,
                  hintText: 'Password',
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {},
                  obscure: false,
                  label: '',
                  subTitle: '',
                  validatorFn: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a password";
                    } else if (value.length < 6) {
                      return "Minimum Password length is 6";
                    }
                    return null; // Return null if the validation passes.
                  },
                ),
                padding10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          side:
                              const BorderSide(color: AppColors.grey, width: 2),
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
                                color: AppColors.grey,
                                fontSize: MyFonts.size16)),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text("Forgot Password",
                          style: getMediumStyle(
                              color: AppColors.appColor,
                              fontSize: MyFonts.size16)),
                    ),
                  ],
                ),
                //handle error string here
                // if (controller.errorString.value.isNotEmpty)
                //   Text(
                //     controller.errorString.value,
                //     style: TextStyle(color: Colors.red),
                //   ),
                padding10,
                CustomButton(
                  onPressed: () async {
                    //mthod to handle userLogin
                  },
                  buttonText: "Login",
                  fontSize: 18,
                  borderRadius: 100.r,
                  backColor: AppColors.appColor,
                ),
                const ULoginBottomSection(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
