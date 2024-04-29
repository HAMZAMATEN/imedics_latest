// ignore_for_file: body_might_complete_normally_nullable, prefer_const_constructors, must_be_immutable, unnecessary_null_comparison

import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/session/controller.dart';
import 'package:imedics_latest/screens/doctors/session/register/controller.dart';
import 'package:imedics_latest/screens/doctors/session/register/setUpProfile.dart';
import 'package:imedics_latest/screens/doctors/session/widgets/session_widgets.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class DoctorRegisterView extends StatefulWidget {
  DoctorRegisterView({super.key, required this.isofficedocor});

  bool isofficedocor;

  @override
  State<DoctorRegisterView> createState() => _DoctorTabSignInState();
}

class _DoctorTabSignInState extends State<DoctorRegisterView> {
  final controller = Get.put(IndividualDoctorRegisterController());
  bool passObscure = true;
  String dropdownValue = 'Heart Specialist';
  List<String> dropdownItems = [
    'Heart Specialist',
    'Neurologist ',
    'Eye Specialist ',
    'Dentist ',
    'Gynecology',
    'Orthopedic ',
    'Urology',
    'Otrology ',
    'Pediatric ',
    ' Skin Specialist',
    'Gasstroenterology',
    'General',
  ]; // Items for the dropdown
  String items = '';
  bool value = false;
  String? _filePath;
  String? _fileName;

  Future<void> _pickDocument() async {
    print('File picker clicked');
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'jpg', 'jpeg', 'png', // Image extensions
          'pdf', 'doc', 'docx' // Document extensions
        ],
      );

      if (result != null) {
        File file = File(result.files.single.path!);
        setState(() {
          _filePath = file.path; // Store the selected file path
          _fileName = file.path.split('/').last; // Extract file name
        });
      } else {
        print("User canceled the picker");
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screeenWdth = MediaQuery.of(context).size.width;
    final screeenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
            ),
            width: screeenWdth * 0.95,
            child: DropdownButtonFormField<String>(
              value: dropdownValue,
              onChanged: (value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              iconSize: 24,
              decoration: InputDecoration(
                prefixIcon: Image.asset(
                  'assets/images/cate.png',
                  width: 30,
                  height: 30,
                  color: Colors.black,
                ),
                hintText: 'Title',
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.w500),
                filled: true,
                fillColor: Colors.white,
                // Set the border side and color
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide(
                    color: AppColors.loginScreenTextColor.withOpacity(0.16),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                    // Set the focused border color
                    width: 1,
                  ),
                ),
              ),
              items: dropdownItems.map((String value) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.center,
                  value: value,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            value == dropdownValue ? Colors.grey : Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          padding10,
          CustomTextField(
            validatorFn: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
            leadingIconPath: AppAssets.user,
            texfieldHeight: 60.h,
            controller: controller.state.registerIndividualDoctorFullNameCon,
            hintText: 'Full Name ',
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]'))
            ],
            obscure: false,
            label: '',
            subTitle: '',
          ),
          padding10,
          CustomTextField(
            validatorFn: (value) {
              if (value! == null || value.isEmpty) {
                return "Please enter an email address";
              } else if (!value.contains("@")) {
                return "Invalid email address";
              }
              return null; // Return null if the validation passes.
            },
            leadingIconPath: AppAssets.email,
            texfieldHeight: 60.h,
            controller: controller.state.registerIndividualDoctorEmailCon,
            hintText: 'Email',
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: '',
            subTitle: '',
          ),
          padding10,
          Container(
            height: 70,
            //  margin: EdgeInsets.only(bottom: 5.h, top: 10.h),

            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.9),
                  offset: Offset.zero,
                  blurRadius: 1,
                )
              ]),
              height: 60,
              child: TextFormField(
                controller:
                    controller.state.registerIndividualDoctorPasswordCon,
                obscureText: passObscure,
                style: getMediumStyle(
                    fontSize: MyFonts.size16, color: AppColors.black),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(
                        color: AppColors.loginScreenTextColor
                            .withOpacity(0.16), // Border color
                        width: 1, // Border width
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(
                        color: Colors.red, // Border color
                        width: 1, // Border width
                      )),

                  filled: true,
                  fillColor: Colors.white,
                  // Background color
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide(
                      color: AppColors.loginScreenTextColor.withOpacity(0.16),
                      width: 1, // Border width
                    ),
                  ),
                  // contentPadding: EdgeInsets.only(top: 15, left: 20.w),
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
                  // return null;
                },
              ),
            ),
          ),
          padding10,
          DoctorCalenderTextFieldWidget(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validatorFn: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your date of birth';
              }
              return null;
            },
            leadingIconPath: '',
            texfieldHeight: 60.h,
            controller: controller.state.registerIndividualDoctorDateOfBirthCon,
            hintText: 'Date of Birth',
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            label: '',
            subTitle: '',
          ),
          padding10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: CustomTextField(
                  validatorFn: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your date of birth';
                    }
                    return null;
                  },
                  leadingIcon: CountryCodePicker(
                    padding: EdgeInsets.only(left: 10.w, top: 6.h),
                    flagWidth: 15,
                    backgroundColor: Colors.red,
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: Colors.white,
                    ),
                    barrierColor: Colors.black.withOpacity(0.5),
                    onChanged: (CountryCode code) {
                      // setState(() {
                      //   // countryCode = code;
                      //   // print(countryCode);
                      //  });
                    },
                    dialogBackgroundColor: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.5),
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                  texfieldHeight: 60.h,
                  controller:
                      controller.state.registerIndividualDoctorPhoneNumberCon,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  hintText: 'Phone Number',
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {},
                  obscure: false,
                  label: '',
                  subTitle: '',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: screeenWdth,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              border: Border.all(color: Colors.grey.shade200, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 10.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/pastport.png',
                    width: 30,
                    height: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: screeenWdth / 3,
                    child: Text(
                      _fileName != null
                          ? _fileName.toString()
                          : "Upload passport",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.grey.withOpacity(0.9)),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: _pickDocument,
                    child: Container(
                      alignment: Alignment.center,
                      width: screeenWdth / 3,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                          begin: Alignment
                              .topLeft, // Gradient starts at the top left
                          end: Alignment
                              .bottomRight, // and ends at the bottom right
                          colors: [
                            Color(0xFF5EEF8F), // Color #5EEF8F
                            Color(0xFF00A69D), // Color #00A69D
                          ],
                        ),
                      ),
                      child: Text(
                        'Upload',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
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
                  Text('Agree with ',
                      style: getMediumStyle(
                          color: AppColors.grey, fontSize: MyFonts.size16)),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Text(termsandConditions,
                    style: getMediumStyle(
                        color: AppColors.appColor, fontSize: MyFonts.size16)),
              ),
            ],
          ),
          padding10,
          CustomButton(
            onPressed: () {
              Get.to(
                () => SetupIndividualProfileView(isofficedoctor: false),
              );
              // controller.doctorIndRegister();
              // if (controller.formKey.currentState!.validate()) {
              if (controller.state.registerIndividualDoctorFullNameCon.text
                      .isNotEmpty &&
                  controller
                      .state.registerIndividualDoctorEmailCon.text.isNotEmpty &&
                  controller.state.registerIndividualDoctorDateOfBirthCon.text
                      .isNotEmpty &&
                  controller.state.registerIndividualDoctorPhoneNumberCon.text
                      .isNotEmpty &&
                  controller.state.registerIndividualDoctorPasswordCon.text
                      .isNotEmpty) {
                if (widget.isofficedocor == true) {
                  // Navigator.pushNamed(
                  //     context, AppRoutes.officedoctorRegistration);
                } else {
                  // Navigator.pushNamed(context, AppRoutes.doctorRegistration);
                }
              } else {
                Snackbar.showSnackBar(
                    'All field must be filled.', Icons.error_outline);
              }
            },
            //  },
            buttonText: signup,
            fontSize: 18,
            borderRadius: 100.r,
            backColor: AppColors.appColor,
          ),
        ],
      ),
    );
  }
}
