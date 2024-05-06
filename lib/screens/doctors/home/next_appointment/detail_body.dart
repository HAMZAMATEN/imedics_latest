import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/components/show_custom_dialogue.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/models/doctors/patient_model.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/controller.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:imedics_latest/screens/patient_screens/user_DoctorDetails/widget/user_about_doc_tab.dart';
import 'package:imedics_latest/screens/patient_screens/user_DoctorDetails/widget/user_review_doc_tab.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class PatientDetailBody extends StatelessWidget {
  PatientModel patientModel;
  PatientAppointmentModel appoint;
  PatientDetailBody({
    super.key,
    required this.patientModel,
    required this.appoint,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllAppointmentController());
    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              padding40,
              Expanded(
                child: Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r)),
                    color: AppColors.white.withOpacity(0.9),
                  ),
                  child: Column(
                    children: [
                      padding80,
                      Text(
                        patientModel.username!,
                        style: getBoldStyle(
                            color: AppColors.black, fontSize: MyFonts.size20),
                      ),
                      padding6,
                      Text(
                        patientModel.email!,
                        style: getSemiBoldStyle(
                            color: AppColors.grey, fontSize: MyFonts.size14),
                      ),
                      padding6,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "> 1 hour",
                                style: getSemiBoldStyle(
                                    color: AppColors.appColor,
                                    fontSize: MyFonts.size12),
                              ),
                              Text(
                                'WAIT TIME',
                                style: getSemiBoldStyle(
                                    color: AppColors.grey,
                                    fontSize: MyFonts.size10),
                              ),
                            ],
                          ),
                          Container(
                            height: 43.h,
                            width: 2.w,
                            color: AppColors.lightgrey,
                          ),
                          // Column(
                          //   children: [
                          //     Text(
                          //       doctor.yearofexperience!,
                          //       style: getSemiBoldStyle(
                          //           color: AppColors.appColor,
                          //           fontSize: MyFonts.size12),
                          //     ),
                          //     Text(
                          //       'EXPERIENCE',
                          //       style: getSemiBoldStyle(
                          //           color: AppColors.grey,
                          //           fontSize: MyFonts.size10),
                          //     ),
                          //   ],
                          // ),
                          Container(
                            height: 43.h,
                            width: 2.w,
                            color: AppColors.lightgrey,
                          ),
                          Column(
                            children: [
                              Text(
                                '98% ',
                                style: getSemiBoldStyle(
                                    color: AppColors.appColor,
                                    fontSize: MyFonts.size12),
                              ),
                              Text(
                                'SATISFIED',
                                style: getSemiBoldStyle(
                                    color: AppColors.grey,
                                    fontSize: MyFonts.size10),
                              ),
                            ],
                          ),
                        ],
                      ),
                      padding50,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Appoitment",
                                  style: getSemiBoldStyle(
                                      color: Colors.black,
                                      fontSize: MyFonts.size20),
                                )),
                            detailRow("Date", "${appoint.selectedDate}"),
                            detailRow("Time", "${appoint.selectedTimeSlot}"),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Patient Info",
                                  style: getSemiBoldStyle(
                                      color: Colors.black,
                                      fontSize: MyFonts.size20),
                                )),
                            detailRow("Full Name", "${AppConstants.userName}"),
                            detailRow("Gender", "${appoint.gender}"),
                            detailRow("Age", "${appoint.patientAge}"),
                            padding30,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 20.w),
        //   child: Align(
        //     alignment: Alignment.bottomCenter,
        //     child: CustomButton(
        //       buttonText: "Join call.Doctor will be here soon!",
        //       onPressed: () {
        //
        //         showAppCustomDialogue(context, "Join Call", "Once join, don't leave until you finish your appointment", "Confirm to join", Icon(Icons.error_outline,color: AppColors.appColor,), () {
        //           controller.checkAndJoinCall(appoint,doctor);
        //         });
        //
        //       },
        //     ),
        //   ),
        // )
      ],
    );
  }
}

Widget detailRow(String title, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${title}",
          style:
          getSemiBoldStyle(color: Colors.black54, fontSize: MyFonts.size15),
        ),
        Text(
          "${value}",
          textAlign: TextAlign.right,
          style:
          getSemiBoldStyle(color: Colors.black54, fontSize: MyFonts.size15),
        ),
      ],
    ),
  );
}
