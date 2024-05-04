import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/models/doctors/patient_model.dart';
import 'package:imedics_latest/screens/doctors/home/controller.dart';
import 'package:imedics_latest/screens/doctors/records/controller.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class AppointmentDetailView extends StatelessWidget {
  final String image;
  final PatientAppointmentModel patientAppointmentModel;
  final DoctorHomeController homeController;

  const AppointmentDetailView({
    super.key,
    required this.image,
    required this.patientAppointmentModel,
    required this.homeController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 251, 250, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(246, 251, 250, 1),
        centerTitle: true,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: AppColors.black,
          ),
        ),
        title: Text(
          'Appointment Details',
          style: getSemiBoldStyle(
              color: AppColors.black94,
              fontSize: 20.sp), // Make sure these style helpers exist
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width,
                height: 126.h,
                // Use the isExpanded flag
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9),
                  // border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                ),
                // The rest of your widget code remains the same
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Row(
                          children: [
                            // Image container
                            Container(
                              height: 81.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                // border: Border.all(color: Colors.grey.withOpacity(0.5)),
                              ),
                              child: Center(
                                child: Image.asset(
                                  image,
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            // Text section
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FutureBuilder<PatientModel>(
                                      future: homeController
                                          .fetchParticularPatientDetails(
                                          patientAppointmentModel.userId
                                              .toString()),
                                      builder: (context,
                                          AsyncSnapshot<PatientModel>
                                          snapshot) {
                                        if (!snapshot.hasData) {
                                          return Container(
                                              height: 30.h,
                                              child: ShowProgressIndicator());
                                        }
                                        return Text(
                                          snapshot.data!.username.toString(),
                                          style: getBoldStyle(
                                              color: AppColors.black,
                                              fontSize: MyFonts.size16),
                                        );
                                      }),
                                  SizedBox(
                                    height: 4.w,
                                  ),
                                  Text(
                                    homeController.convertDate(
                                      patientAppointmentModel.selectedDate
                                          .toString(),
                                    ),
                                    style: getSemiBoldStyle(
                                      fontSize: 14.sp,
                                      color: Color.fromRGBO(136, 136, 136, 1),
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  RichText(
                                    text: TextSpan(
                                      style: getSemiBoldStyle(
                                        color: Color.fromRGBO(136, 136, 136, 1),
                                        fontSize: 14.sp,
                                      ),
                                      children: [
                                        TextSpan(text: 'Status: '),
                                        TextSpan(
                                          text: 'Completed',
                                          style: getSemiBoldStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.appColor),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Action buttons row
                  ],
                ),
              ),
              padding16,
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width,
                // height: 126.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date & Time',
                      style:
                      getBoldStyle(color: AppColors.black, fontSize: 16.sp),
                    ),
                    padding10,
                    Container(
                      height: 44.h,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(
                          color: Color.fromRGBO(136, 144, 152, 0.85),
                          width: 1.2,
                        ),
                        color: Color.fromRGBO(136, 144, 152, 0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            homeController.convertDate(
                              patientAppointmentModel.selectedDate.toString(),
                            ),
                            style: getSemiBoldStyle(
                              color: AppColors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            patientAppointmentModel.selectedTimeSlot.toString(),
                            style: getSemiBoldStyle(
                              color: AppColors.black,
                              fontSize: 14.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              padding16,
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width,
                // height: 126.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shared Documents',
                      style:
                      getBoldStyle(color: AppColors.black, fontSize: 16.sp),
                    ),
                    padding16,
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection(AppConstants.userCollection)
                            .where('id',
                            isEqualTo:
                            patientAppointmentModel.userId.toString())
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: ShowProgressIndicator());
                          }
                          return snapshot.data!.docs.isEmpty
                              ? Center(
                            child: Text(
                              'No documents shared yet',
                              style:
                              getSemiBoldStyle(color: Colors.black),
                            ),
                          )
                              : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return

                                  snapshot.data!.docs[index]
                                  ['Blood-Report'] ==
                                      0 ||
                                      snapshot.data!.docs[index]
                                      ['CT-Scan'] ==
                                          0
                                      ||
                                      snapshot.data!.docs[index]
                                      ['MRI'] ==
                                          0
                                      ?
                                  Center(
                                    child: Text(
                                      'No documents shared yet',
                                      style:
                                      getSemiBoldStyle(color: Colors.black),
                                    ),
                                  )
                                      :
                                  snapshot.data!.docs[index]
                                  ['Blood-Report'] ==
                                      0
                                      ? Container()
                                      : InkWell(
                                    onTap: (){

                                    },
                                        child: Row(
                                                                            children: [
                                        Container(
                                          height: 75.h,
                                          width: 81.w,
                                          // padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                5.r),
                                            border: Border.all(
                                              color: Color.fromRGBO(
                                                  136, 144, 152, 0.85),
                                              width: 1.2,
                                            ),
                                            color: Color.fromRGBO(
                                                136, 144, 152, 0.1),
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
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Blood Report',
                                              style: getBoldStyle(
                                                color: AppColors.black,
                                                fontSize: 18.sp,
                                              ),
                                            ),
                                            FutureBuilder<PatientModel>(
                                                future: homeController
                                                    .fetchParticularPatientDetails(
                                                    snapshot.data!.docs[index]['id'.toString()]),
                                                builder: (context,
                                                    AsyncSnapshot<
                                                        PatientModel>
                                                    snapshot) {
                                                  if (!snapshot.hasData) {
                                                    return Container(
                                                        height: 30.h,
                                                        child:
                                                        ShowProgressIndicator());
                                                  }
                                                  return Text(
                                                    "Shared By: "+snapshot.data!.username
                                                        .toString(),
                                                    style: getBoldStyle(
                                                        color:
                                                        AppColors.appColor,
                                                        fontSize:
                                                        MyFonts.size16),
                                                  );
                                                }),
                                            SizedBox(
                                              height: 4.w,
                                            ),
                                            Text(
                                              '${snapshot.data!.docs[index]['Blood-Report'].length} Document',
                                              style: getBoldStyle(
                                                color: Color.fromRGBO(
                                                    136, 136, 136, 1),
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                                                            ],
                                                                          ),
                                      );
                              });
                        }),
                    padding16,
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection(AppConstants.userCollection)
                            .where('id',
                            isEqualTo:
                            patientAppointmentModel.userId.toString())
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: ShowProgressIndicator());
                          }
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return snapshot.data!.docs[index]['MRI'].length == 0
                                    ? Container()
                                    : Row(
                                  children: [
                                    Container(
                                      height: 75.h,
                                      width: 81.w,
                                      // padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(5.r),
                                        border: Border.all(
                                          color: Color.fromRGBO(
                                              136, 144, 152, 0.85),
                                          width: 1.2,
                                        ),
                                        color: Color.fromRGBO(
                                            136, 144, 152, 0.1),
                                      ),
                                      child: Center(
                                        child: Container(
                                          height: 43.h,
                                          width: 43.w,
                                          child: Image.asset(
                                            AppAssets.mri,
                                            color: AppColors.appColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'MRI',
                                          style: getBoldStyle(
                                            color: AppColors.black,
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                        FutureBuilder<PatientModel>(
                                            future: homeController
                                                .fetchParticularPatientDetails(
                                                snapshot.data!.docs[index]['id'.toString()]),
                                            builder: (context,
                                                AsyncSnapshot<
                                                    PatientModel>
                                                snapshot) {
                                              if (!snapshot.hasData) {
                                                return Container(
                                                    height: 30.h,
                                                    child:
                                                    ShowProgressIndicator());
                                              }
                                              return Text(
                                                "Shared By: "+snapshot.data!.username
                                                    .toString(),
                                                style: getBoldStyle(
                                                    color:
                                                    AppColors.appColor,
                                                    fontSize:
                                                    MyFonts.size16),
                                              );
                                            }),
                                        SizedBox(
                                          height: 4.w,
                                        ),
                                        Text(
                                          '${snapshot.data!.docs[index]['MRI'].length} Document',
                                          style: getBoldStyle(
                                            color: Color.fromRGBO(
                                                136, 136, 136, 1),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              });
                        }),
                    padding16,
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection(AppConstants.userCollection)
                            .where('id',
                            isEqualTo:
                            patientAppointmentModel.userId.toString())
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: ShowProgressIndicator());
                          }
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return snapshot.data!.docs[index]['CT-Scan'].length ==
                                    0
                                    ? Container()
                                    : Row(
                                  children: [
                                    Container(
                                      height: 75.h,
                                      width: 81.w,
                                      // padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(5.r),
                                        border: Border.all(
                                          color: Color.fromRGBO(
                                              136, 144, 152, 0.85),
                                          width: 1.2,
                                        ),
                                        color: Color.fromRGBO(
                                            136, 144, 152, 0.1),
                                      ),
                                      child: Center(
                                        child: Container(
                                          height: 43.h,
                                          width: 43.w,
                                          child: Image.asset(
                                            AppAssets.ctscan,
                                            color: AppColors.appColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'CT-Scan',
                                          style: getBoldStyle(
                                            color: AppColors.black,
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                        FutureBuilder<PatientModel>(
                                            future: homeController
                                                .fetchParticularPatientDetails(
                                                snapshot.data!.docs[index]['id'.toString()]),
                                            builder: (context,
                                                AsyncSnapshot<
                                                    PatientModel>
                                                snapshot) {
                                              if (!snapshot.hasData) {
                                                return Container(
                                                    height: 30.h,
                                                    child:
                                                    ShowProgressIndicator());
                                              }
                                              return Text(
                                                "Shared By: "+snapshot.data!.username
                                                    .toString(),
                                                style: getBoldStyle(
                                                    color:
                                                    AppColors.appColor,
                                                    fontSize:
                                                    MyFonts.size16),
                                              );
                                            }),
                                        SizedBox(
                                          height: 4.w,
                                        ),
                                        Text(
                                          '${snapshot.data!.docs[index]['CT-Scan'].length} Document',
                                          style: getBoldStyle(
                                            color: Color.fromRGBO(
                                                136, 136, 136, 1),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              });
                        }),
                  ],
                ),
              ),
              padding16,
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width,
                // height: 126.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chat History',
                      style:
                      getBoldStyle(color: AppColors.black, fontSize: 16.sp),
                    ),
                    padding16,
                    Row(
                      children: [
                        Container(
                          height: 75.h,
                          width: 70.w,
                          // padding: EdgeInsets.all(10),
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed.',
                            // maxLines: 5,
                            style: getSemiBoldStyle(
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 75.h,
                          width: 70.w,
                          // padding: EdgeInsets.all(10),
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed.',
                            // maxLines: 5,
                            style: getSemiBoldStyle(
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 75.h,
                          width: 70.w,
                          // padding: EdgeInsets.all(10),
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed.',
                            // maxLines: 5,
                            style: getSemiBoldStyle(
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 75.h,
                          width: 70.w,
                          // padding: EdgeInsets.all(10),
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed.',
                            // maxLines: 5,
                            style: getSemiBoldStyle(
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 75.h,
                          width: 70.w,
                          // padding: EdgeInsets.all(10),
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed.',
                            // maxLines: 5,
                            style: getSemiBoldStyle(
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              padding16,
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width,
                // height: 126.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Feedback',
                      style:
                      getBoldStyle(color: AppColors.black, fontSize: 16.sp),
                    ),
                    padding16,
                    Row(
                      children: [
                        Container(
                          height: 75.h,
                          width: 70.w,
                          // padding: EdgeInsets.all(10),
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed.',
                            // maxLines: 5,
                            style: getSemiBoldStyle(
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
