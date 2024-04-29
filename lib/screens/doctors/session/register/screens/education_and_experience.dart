// ignore_for_file: must_be_immutable

import 'package:country_list/country_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/components/session_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/session/register/controller.dart';
import 'package:imedics_latest/screens/doctors/session/register/setUpProfile.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class EducationAndExpirienceView extends StatelessWidget {
  EducationAndExpirienceView(
      {super.key, required this.onPressed, required this.onPressedback});

  final VoidCallback onPressed;
  final VoidCallback onPressedback;

  // final TextEditingController namecontroller = TextEditingController();
  SetupIndividualProfileView doctorRegistration =
      SetupIndividualProfileView(isofficedoctor: true);

  final contoller = Get.put(IndividualDoctorRegisterController());
  List<String> countryNames =
      Countries.list.map((country) => country.name).toList();

  @override
  Widget build(BuildContext context) {
    String countryValue =
        countryNames.isNotEmpty ? countryNames[0] : 'Select a country';
    return Container(
      width: 1.sw,
      decoration: const BoxDecoration(
        color: AppColors.lightBg,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: ListView(
          children: [
            SizedBox(
              height: 15.h,
            ),
            padding10,
            CustomTextField(
              validatorFn: (value) {
                if (value!.isEmpty) {
                  return 'Please eduction';
                }
                return null;
              },
              texfieldHeight: 60.h,
              controller: contoller.state.registerIndividualDoctorEducationCon,
              hintText: 'Education',
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
              controller: contoller.state.registerIndividualDoctorCollageCon,
              hintText: 'College/ University',
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]'))
              ],
              obscure: false,
              label: '',
              subTitle: '',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              borderRadius: 12,
              validatorFn: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              texfieldHeight: 60.h,
              controller:
                  contoller.state.registerIndividualDoctorLicene_numberCon,
              hintText: 'license & Number',
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              obscure: false,
              label: '',
              subTitle: '',
            ),
            padding10,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
              ),
              child: DropdownButtonFormField<String>(
                value: countryValue,
                onChanged: (value) {
                  countryValue = value!;
                },
                iconSize: 25,
                decoration: InputDecoration(
                  hintText: 'Select a country',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                  filled: true,
                  fillColor: Colors.white,
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
                      color: AppColors.loginScreenTextColor.withOpacity(0.16),
                      width: 1,
                    ),
                  ),
                ),
                items: countryNames.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 16,
                                color: value == countryValue
                                    ? Colors.grey
                                    : Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
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
                    'Secure & Confidential',
                    style: getSemiBoldStyle(
                        color: AppColors.grey, fontSize: MyFonts.size18),
                  ),
                ],
              ),
            ),
            CustomTextField(
              borderRadius: 12,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validatorFn: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              texfieldHeight: 60.h,
              controller: contoller
                  .state.registerIndividualDoctorYears_of_experianceCon,
              hintText: 'Years Of Experiences',
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              obscure: false,
              label: '',
              subTitle: '',
            ),
            padding20,
            SessionButton(
              text: 'Next',
              back: onPressedback,
              isbackbuton: true,
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
