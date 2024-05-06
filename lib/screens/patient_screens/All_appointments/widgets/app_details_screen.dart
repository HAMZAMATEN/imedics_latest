import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/widgets/all_uploaded_documents.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  UserDocModel doc;
  PatientAppointmentModel appoint;
  AppointmentDetailsScreen(
      {super.key, required this.doc, required this.appoint});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Appointment Details",
          style: getSemiBoldStyle(
              color: AppColors.appColor, fontSize: MyFonts.size18),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.appColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 8.w, top: 5, bottom: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    doc.image != null
                        ? CachedNetworkImage(
                            imageUrl:
                                "${AppConstants.imageBaseUrl + doc.image!}",
                            height: 100.h,
                            width: 80.w,
                            fit: BoxFit.contain,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/defaultDoc.jpg', // Path to your default image
                              height: 92.h,
                              width: 82.w,
                              fit: BoxFit.contain,
                            ),
                          )
                        : Image.asset(
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
                          padding10,
                          Container(
                            child: FittedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    doc.name!,
                                    overflow: TextOverflow.clip,
                                    style: getBoldStyle(
                                        color: Color(0xff171F3F),
                                        fontSize: MyFonts.size18),
                                  ),
                                  padding10,
                                ],
                              ),
                            ),
                          ),
                          Text(
                            doc.specialization!,
                            style: TextStyle(color: Colors.black54),
                          ),
                          padding10,
                          Text(
                            doc.education!,
                            style: TextStyle(color: Colors.black54),
                          ),
                          padding10,
                        ],
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Colors.black12,
                ),
                padding10,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Duration: ",
                              style: TextStyle(
                                  color: AppColors.appColor, fontSize: 15.sp),
                            ),
                            Text(
                              "30 Minutes",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1.sw,
                  height: 108.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Date & Time',
                            style: getBoldStyle(
                                color: AppColors.black,
                                fontSize: MyFonts.size16)),
                        padding4,
                        Container(
                          height: 44.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: AppColors.lightgrey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${appoint.selectedDate}",
                                  style: getSemiBoldStyle(
                                      color: AppColors.black,
                                      fontSize: MyFonts.size14),
                                ),
                                Text(
                                  "${appoint.selectedTimeSlot}",
                                  style: getSemiBoldStyle(
                                      color: AppColors.black,
                                      fontSize: MyFonts.size14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black12,
                ),
                padding5,
                InkWell(
                  hoverColor: Colors.transparent,
                  onTap: (){
                    Get.to(()=>AllUploadedDocumetns(doc: doc, appoint: appoint));
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 75.h,
                        width: 81.w,
                      // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                            color: Color.fromRGBO(136, 144, 152, 0.85),
                            width: 1.2,
                          ),
                          color: Color.fromRGBO(136, 144, 152, 0.1),
                        ),
                        child: Center(
                          child: Container(
                            height: 43.h,
                            width: 43.w,
                            child: Image.asset(
                                AppAssets.bloodRep,
                              color: AppColors.appColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Share Documetns',
                            style: getBoldStyle(
                              color: AppColors.black,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 4.w,
                          ),
                          Text(
                            'with ${doc.name}',
                            style: getBoldStyle(
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                        Spacer(),
                        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: AppColors.appColor,)),
                    ],
                  ),
                ),
                  padding5,
                  Divider(
                      color: Colors.black12,
                  ),
                  padding5,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
