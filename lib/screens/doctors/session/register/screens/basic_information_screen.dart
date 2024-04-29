// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/components/session_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/session/register/controller.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class BasicInformationView extends StatefulWidget {
  BasicInformationView(
      {super.key, required this.onPressed, required this.onPressedback});
  final VoidCallback onPressed;
  final VoidCallback onPressedback;

  @override
  State<BasicInformationView> createState() => _BasicInformationViewState();
}

class _BasicInformationViewState extends State<BasicInformationView> {
  final TextEditingController namecontroller = TextEditingController();

  File? _image;
  // Variable to hold the picked image
  Future<void> _pickImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        controller.state.imagePath = _image!; // Update the state with the new image
      });
    }
  }

  final controller = Get.put(IndividualDoctorRegisterController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Container(
            width: 1.sw,
            // height: 800.h,
            decoration: const BoxDecoration(
              color: AppColors.lightBg,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    padding64,
                    CustomTextField(
                      validatorFn: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      texfieldHeight: 60.h,
                      controller: controller.state.registerIndividualDoctorSpecializationCon,
                      hintText: 'Specialization',
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]'))
                      ],
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {},
                      obscure: false,
                      label: '',
                      subTitle: '',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      validatorFn: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      texfieldHeight: 60.h,
                      controller: controller.state.registerIndividualDoctorCondionTretmentCon,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]'))
                      ],
                      hintText: 'Conditions Treated',
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {},
                      obscure: false,
                      label: '',
                      subTitle: '',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),

                      height: 150, // Set the height of the container
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset.zero,
                            blurRadius: 2,
                          )
                        ],

                        border: Border.all(
                            color:
                            AppColors.loginScreenTextColor.withOpacity(0.16),
                            width: 1),
                        color: Colors
                            .white, // Set the background color of the container
                        borderRadius: BorderRadius.circular(
                            15), // Set the border radius of the container
                      ),
                      // Add some padding inside the container
                      child: TextField(
                        controller: controller.state.registerIndividualDoctorAboutYourselfCon,
                        textAlign: TextAlign.start,
                        maxLines: 5, // Allows multiple lines of input
                        decoration: InputDecoration(
                          hintText: "Tell us about yourself",
                          border: InputBorder
                              .none, // Removes the underline of the input field
                          // Optionally, you can add more styling to the input decoration here
                        ),
                        // You can further customize the TextField (e.g., set a controller, style, etc.)
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Max 100 Words',
                            style: getSemiBoldStyle(
                                color: AppColors.grey, fontSize: MyFonts.size14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SessionButton(
                      back: () {
                        Navigator.of(context).pop();
                      },
                      text: 'Next',
                      isbackbuton: true,
                      onPressed: widget.onPressed,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -60,
          left: 0,
          right: 0,
          child: CircleAvatar(
            radius: 70.w,
            backgroundColor: AppColors.lightBg,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.grey.withOpacity(0.20),
              child: _image == null
                  ? Text(
                'Add\nPhoto',
                textAlign: TextAlign.center,
                style: getSemiBoldStyle(
                    color: AppColors.grey, fontSize: MyFonts.size14),
              )
                  : ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.file(
                  _image!,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 45,
          left: 230,
          child: GestureDetector(
            onTap: _pickImage, // Call the function to pick an image
            child: Container(
              alignment: Alignment.center,
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey.withOpacity(0.9)),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
