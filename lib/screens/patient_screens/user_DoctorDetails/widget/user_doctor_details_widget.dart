

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:imedics_latest/screens/patient_screens/user_DoctorDetails/widget/user_about_doc_tab.dart';
import 'package:imedics_latest/screens/patient_screens/user_DoctorDetails/widget/user_review_doc_tab.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class UserDoctorDetailBody extends StatelessWidget {
  UserDocModel doctor;
  double rat;
  String review;
  UserDoctorDetailBody(
      {super.key,
       required this.doctor,
      required this.rat,
        required this.review,
      });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        child: Container(
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
                        doctor.name!,
                        style: getBoldStyle(
                            color: AppColors.black, fontSize: MyFonts.size20),
                      ),
                      padding6,
                      Text(
                        doctor.specialization!,
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
                          Column(
                            children: [
                              Text(
                                doctor.yearofexperience!,
                                style: getSemiBoldStyle(
                                    color: AppColors.appColor,
                                    fontSize: MyFonts.size12),
                              ),
                              Text(
                                'EXPERIENCE',
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
                          Column(
                            children: [
                              Text(
                                '98% (${review})',

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
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: TabBar(
                            dividerColor: Colors.grey.shade300,
                            labelStyle: getBoldStyle(
                                color: AppColors.appColor,
                                fontSize: MyFonts.size15),
                            unselectedLabelStyle: getBoldStyle(
                                color: AppColors.grey, fontSize: MyFonts.size15),
                            labelColor: AppColors.appColor,
                            unselectedLabelColor: AppColors.grey,
                            indicatorColor: AppColors.appColor,
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: const [
                              Tab(
                                child: Text(
                                  '         About Doctor         ',
                                ),
                              ),
                              Tab(
                                child: Text(
                                  '            Reviews            ',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            UAboutDoctorTabview(doctor: doctor),
                            UserDoctorReviewTab(),
                            // UAboutDoctorTabview(
                            //   docId: D_Id!.toString(),
                            //   doctorSpecificDetail: doctorSpecificDetail,
                            //   specialization: specialization,
                            //   education: education,
                            //   aboutself: aboutself,
                            //   conditionstreated: conditionstreated,
                            //   isdoctor: false,
                            //   name: name!,
                            //   image: image!,
                            // ),
                            // UReviewTabview(),
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
      ),
    );
  }
}
