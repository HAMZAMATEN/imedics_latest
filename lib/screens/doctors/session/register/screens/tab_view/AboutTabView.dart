import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/session_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/session/register/controller.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class AboutDoctorTabview extends StatelessWidget {
  String? image;
  String? docId;
  String? name;
  final String? specialization;
  final String? conditionstreated;
  final String? aboutself;
  final String? education;

  // final List<DoctorSpecificDatailsModel>? doctorSpecificDetail;
  AboutDoctorTabview({
    Key? key,
    this.isdoctor = false,
    this.aboutself,
    this.conditionstreated,
    this.education,
    // this.doctorSpecificDetail,
    this.specialization,
    this.docId,
    this.name,
    this.image,
  }) : super(key: key);
  final bool isdoctor;

  final contoller = Get.put(IndividualDoctorRegisterController());

  @override
  Widget build(BuildContext context) {
    // log('dpcID:${Global().getUserId()}');
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
                        aboutself.toString(),
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
                              specialization.toString(),
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
                                  education.toString(),
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
                                conditionstreated.toString() != "null"
                                    ? conditionstreated.toString()
                                    : "Ectopic Pregnancy",
                                style: getMediumStyle(
                                    color: AppColors.grey,
                                    fontSize: MyFonts.size14),
                              ),
                            ],
                          ),
                          padding10,
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 2.5.h,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                conditionstreated.toString() != "null"
                                    ? conditionstreated.toString()
                                    : "Pregnancy",
                                style: getMediumStyle(
                                    color: AppColors.grey,
                                    fontSize: MyFonts.size14),
                              ),
                            ],
                          ),
                          Container(
                            width: 45.w,
                          ),
                        ],
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
                                conditionstreated.toString() != "null"
                                    ? conditionstreated.toString()
                                    : 'Ectopic Pregnancy',
                                style: getMediumStyle(
                                    color: AppColors.grey,
                                    fontSize: MyFonts.size14),
                              ),
                            ],
                          ),
                          padding10,
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 2.5.h,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                conditionstreated.toString() != "null"
                                    ? conditionstreated.toString()
                                    : 'Endometriosis',
                                style: getMediumStyle(
                                    color: AppColors.grey,
                                    fontSize: MyFonts.size14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      padding18,
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
                        'The fee of Dr.${contoller.state.registerIndividualDoctorFullNameCon.text} ranges from \$${contoller.state.registerIndividualDoctorOnce_consultation_freeCon.text} for appointments. You can also book an online consultation with the doctor.',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
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
          padding10,
          Align(
            alignment: Alignment.bottomCenter,
            child: SessionButton(
              text: 'Done',
              back: () {},
              onPressed: () {
                // print("Doc id is");
                // print(docId!);
                // Get.to(AppointmentDateTime(time: "14", date: "15"));
                // Get.to(Appointment(id: "1231", docId: "123", userId: "123"));
                // Get.to(()=>UBookAppointmentWidget());
                // Get.to(()=> DoctorMainMenuScreenMain());
                //   Get.to(()=>SetAppointmentDetailsScreen(
                //     docId: docId!,
                //       specialization: specialization!,
                //       education: education!,
                //       name: name!,
                //     image:image!,
                //       ));
              },
              isbackbuton: true,
            ),
          )
        ],
      ),
    );
  }
}
