// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/components/session_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';

class MyProfileView extends StatefulWidget {
  MyProfileView();

  @override
  State<MyProfileView> createState() => _EditDoctorProfileScreen2();
}

class _EditDoctorProfileScreen2 extends State<MyProfileView> {
  // final controller = Get.put(DoctorIndHomeProvider());

  ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;

  void _pickImage() async {
    final pickedImage =
    await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _pickedImage = pickedImage;
    });
  }

  // @override
  // void initState() {
  //   _tabController = TabController(length: 2, vsync: this,);
  //   super.initState();
  // }

  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController dateOfBirthController;
  late TextEditingController usernameController;

  void initState() {
    super.initState();
    // Assuming you have a method to fetch user details, and it's already fetched:
    // var userDetails = controller.SpecificDoctorDetailsList[0];

    // print(
    //     'userDetail:${controller.SpecificDoctorDetailsList.length}'); // Example user details

    // usernameController = TextEditingController(text: userDetails.name);
    usernameController = TextEditingController(text: 'UserName');

    // emailController = TextEditingController(text: userDetails.email);
    emailController = TextEditingController(text: 'email@email.com');
    phoneNumberController =
    // TextEditingController(text: userDetails.conditionstreated);
    TextEditingController(text: 'conditions');
    dateOfBirthController =
        TextEditingController(text: 'date');
    // TextEditingController(text: userDetails.daily![0].datefrom);
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneNumberController.dispose();
    dateOfBirthController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.appColor1,
        title: Text(
          'My profile',
          style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600)),

      ),
      body: Container(
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
                                    leadingIconPath: AppAssets.user,
                                    texfieldHeight: 60.h,
                                    controller: usernameController,
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
                                    leadingIconPath: AppAssets.email,
                                    texfieldHeight: 60.h,
                                    controller: emailController,
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
                                    leadingIconPath: AppAssets.calender,
                                    texfieldHeight: 60.h,
                                    controller: dateOfBirthController,
                                    hintText: 'Date Of Birth ',
                                    onChanged: (value) {},
                                    onFieldSubmitted: (value) {},
                                    obscure: false,
                                    label: '',
                                    subTitle: '',
                                  ),
                                  padding30,
                                  SessionButton(
                                    back: () {},
                                    text: 'Save Changes',
                                    onPressed: () {
                                      print('object');
                                      // var userDetails = controller
                                      //     .SpecificDoctorDetailsList[0];
                                      // // print('name:${}')
                                      // var docData = DoctorSpecificDatailsModel(
                                      //   name:
                                      //   usernameController.text.toString(),
                                      //   email: emailController.text.toString(),
                                      //   image: _pickedImage!.path.toString() == '' ? userDetails.image.toString() : _pickedImage!.path,
                                      //   password: userDetails.password,
                                      //   specialization:
                                      //   userDetails.specialization,
                                      //   conditionstreated:
                                      //   userDetails.conditionstreated,
                                      //   college: userDetails.college,
                                      //   aboutself: userDetails.aboutself,
                                      //   education: userDetails.education,
                                      //   license: userDetails.license,
                                      //   yearofexperience:
                                      //   userDetails.yearofexperience,
                                      //   once: userDetails.once,
                                      //   daily: userDetails.daily,
                                      //   weekly: userDetails.weekly,
                                      //   iV: userDetails.iV,
                                      // );
                                      // print('data:$docData');
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: _pickedImage != null
                                                  ? FileImage(File(
                                                  _pickedImage!
                                                      .path)) as ImageProvider<
                                                  Object> // Cast to ImageProvider<Object>
                                                  : AssetImage(
                                                AppAssets.doctorpro,
                                              ),
                                              // Fallback to a default asset image
                                              fit: BoxFit.cover,
                                            ),
                                            color:
                                            AppColors.grey.withOpacity(0.20),
                                          ),

                                          // child: Image.asset(
                                          //   AppAssets.doctorpro,
                                          //   height: 130,
                                          //   width: 130,
                                          // ),
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
                                          onTap: _pickImage,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              color: AppColors.appColor,
                                              // Background color of the icon container
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors
                                                      .white), // Add border to make it stand out
                                            ),
                                            padding: EdgeInsets.all(2),
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.white, // Icon color
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
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
