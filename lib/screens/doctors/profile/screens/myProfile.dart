// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/components/session_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/doctors/profile/controller.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/app_text.dart';

class MyProfileView extends StatefulWidget {
  final DoctorProfileController profileController;

  const MyProfileView({super.key, required this.profileController});



  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.profileController.init();
  }
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;


    log('message');
    return


      Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.appColor1,
        title: Text('My profile',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
      ),
      body:
      Obx(() =>
      widget.profileController.state.profileLoading == true
      ?
      Center(child: ShowProgressIndicator())

      :Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.appColor1,
                        AppColors.appColor,
                      ]),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Stack(
                          children: [
                            Image.asset(
                              AppAssets.loginBg,
                              height: 262.h,
                              width: 307.7.w,
                              color: AppColors.white.withOpacity(0.1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 1.sw,
                                  height: screenHeight * 0.70,
                                  decoration: const BoxDecoration(
                                    color: AppColors.lightBg,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SizedBox(
                                            height: screenHeight * 0.1,
                                          ),
                                          CustomTextField(
                                            validatorFn: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please enter your email';
                                              }
                                              return null;
                                            },

                                            texfieldHeight: 60.h,
                                            controller: widget.profileController
                                                .state.usernameController,
                                            hintText: 'Username ',
                                            onChanged: (value) {},
                                            onFieldSubmitted: (value) {},
                                            obscure: false,
                                            label: '',
                                            subTitle: '',
                                          ),

                                          padding10,


                                          CustomTextField(
                                            validatorFn: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please enter your email';
                                              }
                                              return null;
                                            },
                                            // leadingIconPath: AppAssets.email,
                                            texfieldHeight: 60.h,
                                            controller: widget.profileController
                                                .state.emailController,
                                            hintText: 'Email',
                                            onChanged: (value) {},
                                            onFieldSubmitted: (value) {},
                                            obscure: false,
                                            label: '',
                                            subTitle: '',
                                            onTap: () {},
                                          ),
                                          // CustomTextField(
                                          //   validatorFn: (value) {
                                          //     if (value!.isEmpty) {
                                          //       return 'Please enter your date of birth';
                                          //     }
                                          //     return null;
                                          //   },
                                          //   leadingIcon: CountryCodePicker(
                                          //     padding:
                                          //         EdgeInsets.only(left: 10.w, top: 6.h),
                                          //     flagWidth: 15,
                                          //     backgroundColor: Colors.red,
                                          //     boxDecoration: BoxDecoration(
                                          //       borderRadius:
                                          //           BorderRadius.circular(100.r),
                                          //       color: Colors.white,
                                          //     ),
                                          //     barrierColor:
                                          //         Colors.black.withOpacity(0.5),
                                          //     onChanged: (CountryCode code) {},
                                          //     dialogBackgroundColor: Theme.of(context)
                                          //         .scaffoldBackgroundColor
                                          //         .withOpacity(0.5),
                                          //     showCountryOnly: true,
                                          //     showOnlyCountryWhenClosed: false,
                                          //     alignLeft: false,
                                          //   ),
                                          //   texfieldHeight: 60.h,
                                          //   hintText: 'Phone Number',
                                          //   onChanged: (value) {},
                                          //   onFieldSubmitted: (value) {},
                                          //   label: '',
                                          //   subTitle: '',
                                          //   onTap: () {},
                                          //   controller: phoneNumberController,
                                          //   obscure: false,
                                          // ),
                                          padding10,


                                          CustomTextField(
                                            validatorFn: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please enter your email';
                                              }
                                              return null;
                                            },
                                            // leadingIconPath: AppAssets.user,
                                            texfieldHeight: 60.h,
                                            controller: widget.profileController
                                                .state.aboutYourselfController,
                                            hintText: 'About Yourself',
                                            onChanged: (value) {},
                                            onFieldSubmitted: (value) {},
                                            obscure: false,
                                            label: '',
                                            subTitle: '',
                                          ),
                                          padding30,
                                          widget.profileController
                                              .state
                                              .updateProfileLoading
                                              .value ==
                                              true
                                              ? ShowProgressIndicator()
                                              : SessionButton(
                                            back: () {

                                            },
                                            text: 'Save Changes',
                                            onPressed: () {
                                              print('object');
                                              var model = UserDocModel(
                                                sId: widget.profileController
                                                    .state.docModel.sId
                                                    .toString(),
                                                image: widget.profileController
                                                    .state
                                                    .pickedImage ==
                                                    null
                                                    ? widget.profileController
                                                    .state
                                                    .docModel
                                                    .sId
                                                    .toString()
                                                    : widget.profileController
                                                    .state
                                                    .pickedImage!
                                                    .path
                                                    .toString(),
                                                name: widget.profileController
                                                    .state
                                                    .usernameController
                                                    .text
                                                    .toString(),
                                                email: widget.profileController
                                                    .state
                                                    .emailController
                                                    .text
                                                    .toString(),
                                                password:
                                                widget.profileController
                                                    .state
                                                    .docModel
                                                    .password
                                                    .toString(),
                                                specialization:
                                                widget.profileController
                                                    .state
                                                    .docModel
                                                    .specialization
                                                    .toString(),
                                                conditionstreated:
                                                widget.profileController
                                                    .state
                                                    .docModel
                                                    .conditionstreated
                                                    .toString(),
                                                aboutself: widget.profileController
                                                    .state
                                                    .aboutYourselfController
                                                    .text
                                                    .toString(),
                                                education:
                                                widget.profileController
                                                    .state
                                                    .docModel
                                                    .education
                                                    .toString(),
                                                college: widget.profileController
                                                    .state
                                                    .docModel
                                                    .college
                                                    .toString(),
                                                license: widget.profileController
                                                    .state
                                                    .docModel
                                                    .license
                                                    .toString(),
                                                yearofexperience:
                                                widget.profileController
                                                    .state
                                                    .docModel
                                                    .yearofexperience
                                                    .toString(),
                                                once: widget.profileController
                                                    .state.docModel.once
                                                    .toString(),
                                                daily: widget.profileController
                                                    .state.docModel.daily
                                                    .toString(),
                                                weekly: widget.profileController
                                                    .state.docModel.weekly
                                                    .toString(),
                                                iV: widget.profileController
                                                    .state.docModel.iV,
                                                status: widget.profileController
                                                    .state
                                                    .docModel
                                                    .status,
                                              );
                                              var encodedModel = jsonEncode(model);
                                              widget.profileController.updateDoctorProfile(AppConstants.docId, model);

                                            },
                                            isbackbuton: false,
                                          ),
                                          padding100,
                                          padding100,
                                          padding100,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // CommonpositionPicture(
                                //   onPressed: () {},
                                //   picturepath: AppAssets.doctorpro,
                                // ),

                                Positioned(
                                  top: -63,
                                  right: 0,
                                  left: 0,
                                  child: GetBuilder<DoctorProfileController>(
                                    builder: (con) {
                                      return Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              // Allows the icon to be positioned outside the container bounds
                                              children: [
                                                Container(
                                                  height: 130,
                                                  width: 130,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(
                                                        4.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: widget.profileController
                                                              .state
                                                              .pickedImage ==
                                                              null &&
                                                              widget.profileController
                                                                  .state
                                                                  .imagePath
                                                                  .value !=
                                                                  ''
                                                              ? NetworkImage(
                                                              widget.profileController
                                                                  .state
                                                                  .imagePath
                                                                  .value)
                                                              : widget.profileController
                                                              .state
                                                              .pickedImage !=
                                                              null
                                                              ? FileImage(File(widget.profileController
                                                              .state
                                                              .pickedImage!
                                                              .path)) as ImageProvider<Object> // Cast to ImageProvider<Object>
                                                              : AssetImage(
                                                            AppAssets
                                                                .doctorpro,
                                                          ),
                                                          // Fallback to a default asset image
                                                          fit: BoxFit.cover,
                                                        ),
                                                        color: AppColors.grey
                                                            .withOpacity(0.20),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // Positioned icon at the bottom right
                                                Positioned(
                                                  bottom: -3,
                                                  // Adjust these values as needed to position the icon correctly
                                                  right: -2,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      // Action when the "+" icon is tapped
                                                    },
                                                    child: InkWell(
                                                      onTap: widget.profileController
                                                          .pickImage,
                                                      child: Container(
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                          color: AppColors
                                                              .appColor,
                                                          // Background color of the icon container
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                              width: 1,
                                                              color: AppColors
                                                                  .white), // Add border to make it stand out
                                                        ),
                                                        padding:
                                                        EdgeInsets.all(2),
                                                        child: Icon(
                                                          Icons.edit,
                                                          color: Colors
                                                              .white, // Icon color
                                                          size: 24, // Icon size
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ),
      ),
    );
  }
}
