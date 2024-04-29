import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_field.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
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
                padding10,
                TextFormField(
                  controller: widget.controller.state.emailController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.person_outline),
                      hintText: "Email",
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
                Obx(() => TextFormField(
                  controller: widget.controller.state.passController,
                  obscureText: widget.controller.state.loginIsObscure.value,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.key),
                      suffixIcon: IconButton(
                        onPressed: (){
                          widget.controller.state.loginIsObscure.value = !widget.controller.state.loginIsObscure.value;
                        },
                        icon:widget.controller.state.loginIsObscure.value?Icon(Icons.visibility_off_outlined,color: Colors.grey,):Icon(Icons.visibility,color: Colors.grey,),
                      ),
                      hintText: "Password",
                      hintStyle: getLightStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      )
                  ),
                )),
                padding8,
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
                padding10,
                Obx(() => widget.controller.state.loading.value==true?ShowProgressIndicator(): CustomButton(
                  onPressed: () async {
                    if(widget.controller.state.emailController.text.isEmpty ||
                        widget.controller.state.passController.text.isEmpty
                    ){
                      Snackbar.showSnackBar("Enter all fields", Icons.error_outline);
                    }else{
                      widget.controller.loginWithEmailPass(widget.controller.state.emailController.text.toString().trim(), widget.controller.state.passController.text.toString().trim());
                    }
                    //mthod to handle userLogin
                  },
                  buttonText: "Login",
                  fontSize: 18,
                  borderRadius: 100.r,
                  backColor: AppColors.appColor,
                )),
                const ULoginBottomSection(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
