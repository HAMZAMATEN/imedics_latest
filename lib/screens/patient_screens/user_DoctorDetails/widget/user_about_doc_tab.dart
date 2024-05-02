
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/view.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class UAboutDoctorTabview extends StatelessWidget {
  UserDocModel doctor;
  UAboutDoctorTabview(
      {Key? key,
        required this.doctor
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white54,
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      padding10,
                      Text(
                        'About doctor',
                        style: getSemiBoldStyle(
                            color: AppColors.black, fontSize: MyFonts.size18),
                      ),
                      Text(
                        doctor.aboutself!,
                        style: getMediumStyle(
                            color: AppColors.grey, fontSize: MyFonts.size14),
                      ),
                      padding10,
                      Text(
                        'Specialization',
                        style: getSemiBoldStyle(
                            color: AppColors.black, fontSize: MyFonts.size18),
                      ),
                      padding10,
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 2.5.h,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              doctor.specialization!,
                              style: getMediumStyle(
                                  color: AppColors.grey,
                                  fontSize: MyFonts.size14),
                            ),
                          ),
                        ],
                      ),
                      padding10,
                      Text(
                        'Education',
                        style: getSemiBoldStyle(
                            color: AppColors.black, fontSize: MyFonts.size18),
                      ),
                      padding10,
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 12.w),
                              CircleAvatar(
                                radius: 2.5.h,
                              ),
                              SizedBox(width: 8.w),
                              SizedBox(
                                width: 250.w,
                                child: Text(
                                  doctor.education!,
                                  style: getMediumStyle(
                                      color: AppColors.grey,
                                      fontSize: MyFonts.size14),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      padding10,
                      Text(
                        'Conditions Treated',
                        style: getSemiBoldStyle(
                            color: AppColors.black, fontSize: MyFonts.size18),
                      ),
                      padding10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 2.5.h,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                  doctor.conditionstreated!,
                                style: getMediumStyle(
                                    color: AppColors.grey,
                                    fontSize: MyFonts.size14),
                              ),
                            ],
                          ),
                          padding10,
                          // Row(
                          //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     CircleAvatar(
                          //       radius: 2.5.h,
                          //     ),
                          //     SizedBox(width: 8.w),
                          //     Text(
                          //       conditionstreated.toString()!="null"?conditionstreated.toString():"Pregnancy",
                          //       style: getMediumStyle(
                          //           color: AppColors.grey,
                          //           fontSize: MyFonts.size14),
                          //     ),
                          //   ],
                          // ),
                          Container(
                            width: 45.w,
                          ),
                        ],
                      ),
                      // padding10,
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         CircleAvatar(
                      //           radius: 2.5.h,
                      //         ),
                      //         SizedBox(width: 8.w),
                      //         Text(
                      //           conditionstreated.toString()!="null"?conditionstreated.toString():'Ectopic Pregnancy',
                      //
                      //           style: getMediumStyle(
                      //               color: AppColors.grey,
                      //               fontSize: MyFonts.size14),
                      //         ),
                      //       ],
                      //     ),padding10,
                      //     Row(
                      //       children: [
                      //         CircleAvatar(
                      //           radius: 2.5.h,
                      //         ),
                      //         SizedBox(width: 8.w),
                      //         Text(
                      //           conditionstreated.toString()!="null"?conditionstreated.toString(): 'Endometriosis',
                      //
                      //           style: getMediumStyle(
                      //               color: AppColors.grey,
                      //               fontSize: MyFonts.size14),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // padding18,

                      Text(
                        'Fee',
                        style: getSemiBoldStyle(
                            color: AppColors.black, fontSize: MyFonts.size18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Fee :',
                            style: getSemiBoldStyle(
                                color: AppColors.appColor, fontSize: 14),
                          ),
                          Text(
                            ' (Save Fuel & Time)',
                            style: getSemiBoldStyle(
                                color: Colors.black54, fontSize: 14),
                          ),
                        ],
                      ),
                      padding10,
                      Text(
                        'The fee of Dr.${doctor.name} ranges from \$${doctor.once[0]['consultationfees']}  to \$${(int.parse(doctor.once[0]['consultationfees'])+int.parse(doctor.once[0]['consultationfees'])).toString()} for appointments. You can also book an online consultation with the doctor.',
                        style: getMediumStyle(
                            color: AppColors.grey,
                            fontSize: MyFonts.size14),
                      ),
                      padding50,

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(12),
              //     color: Colors.white54,
              //   ),
              //   child: Padding(
              //     padding:
              //     const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         padding10,
              //         Text(
              //           'Similar Doctors',
              //           style: getSemiBoldStyle(
              //               color: AppColors.black, fontSize: MyFonts.size18),
              //         ),
              //         padding10,
              //       ],
              //     ),
              //   ),
              // ),

            ],
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(buttonText: 'Book Appointment',
                onPressed: (){
                // handle appointment details screen
                  Get.to(()=>SetAppointmentDetailsScreen(doctor: doctor));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
