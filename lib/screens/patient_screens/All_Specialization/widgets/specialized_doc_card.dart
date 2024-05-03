
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:imedics_latest/screens/patient_screens/user_DoctorDetails/view.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class DocDetailCard extends StatelessWidget {
  UserDocModel doctor;
  DocDetailCard(
      {super.key,
        required this.doctor,

      });

  @override
  Widget build(BuildContext context) {
    AppConstants.docFee =(doctor.once[0]['consultationfees']).toString();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8.w, top: 12, bottom: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                doctor.image!=null?
                CachedNetworkImage(
                  imageUrl: "${AppConstants.imageBaseUrl}/${doctor.image}",
                  height: 100.h,
                  width: 80.w,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/defaultDoc.jpg', // Path to your default image
                    height: 92.h,
                    width: 82.w,
                    fit: BoxFit.contain,
                  ),
                ):Image.asset(
                  'assets/images/defaultDoc.jpg', // Path to your default image
                  height: 92.h,
                  width: 82.w,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Icon(Icons.star,color: Color(0xffAAAAAA),),
                          ShaderMask(
                            blendMode: BlendMode.srcATop,
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF7C7C7C),
                                  Color(0xFFB5B5B5),
                                ],
                              ).createShader(bounds);
                            },
                            child: Icon(
                              Icons.star,
                              // size: 48,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xFF7C7C7C), Color(0xFFB5B5B5)],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Center(
                                child: Text(
                                    'PLATINUM PROVIDER',
                                    style: getRegularStyle(color: Colors.white,fontSize: 11)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      padding10,
                      Container(
                        child: FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                doctor.name!,
                                overflow: TextOverflow.clip,
                                style: getBoldStyle(
                                    color: Color(0xff171F3F),
                                    fontSize: MyFonts.size18),
                              ),
                              padding10,
                              // Image.asset(
                              //   AppAssets.star,
                              //   color: Colors.yellow,
                              //   height: 15.h,
                              // ),
                              // Text('5.4')
                            ],
                          ),
                        ),
                      ),
                      Text( doctor.specialization!, style: getRegularStyle(color: Colors.black54,fontSize: 12)),
                      padding10,
                      Text( doctor.education!,style: getRegularStyle(color: Colors.black54,fontSize: 12)),
                      padding10,
                    ],
                  ),
                )
              ],
            ),
            Divider(color: Colors.black12,),
            padding10,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text("Duration: ",style: getSemiBoldStyle(color: AppColors.appColor,fontSize: 15)),
                        Text("30 Minutes",style: getSemiBoldStyle(color: AppColors.black,fontSize: 15)),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text("Fee: ",style: getSemiBoldStyle(color: AppColors.appColor,fontSize: 15)),
                        Text("\$${doctor.once[0]['consultationfees']}",style: getSemiBoldStyle(color: AppColors.black,fontSize: 15),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            padding6,
            Divider(color: Colors.black12,),
            padding6,
            CustomButton(

                onPressed: (){
                  Random random = Random();
                  int rat = random.nextInt(5) + 1;
                  int revi = random.nextInt(1000) + 1;
                Get.to(()=>UserDoctorDetailView(doctor: doctor, rat: double.parse(rat.toString()), review: revi.toString()));
                },
                buttonText: "Book Appointment"),
          ],
        ),
      ),
    );
  }
}
