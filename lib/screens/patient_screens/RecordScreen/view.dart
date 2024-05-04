import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/patient_screens/home/controller.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';
import 'package:shimmer/shimmer.dart';

class UserRecordView extends StatelessWidget {
  const UserRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    // initilizing HomeScreenController
    final controller = Get.put(UserHomeController());
    controller.fetchAllDoctors();
    controller.fetchPatientAppointments();

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Record",
          style:
              getSemiBoldStyle(color: Colors.black, fontSize: MyFonts.size20),
        ),
      ),
      body: SafeArea(
          child: Obx(() => Expanded(
                child: controller.state.appointmentFetchLoading.value == true
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        enabled: true,
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 25.0,
                                ),
                                title: Container(
                                  width: double.infinity,
                                  height: 16.0,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  width: double.infinity,
                                  height: 10.0,
                                  color: Colors.white,
                                ),
                              );
                            }),
                      )
                    : controller.state.completedAppointmentList.length != 0
                        ? ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: controller
                                .state.completedAppointmentList.length,
                            itemBuilder: (context, index) {
                              UserDocModel doc = controller.fetchSingleDoctor(controller.state.completedAppointmentList[index].docId!);
                              return Padding(
                                padding:  EdgeInsets.all(10.w),
                                child: ListTile(
                                  tileColor: Colors.white,
                                  leading: CircleAvatar(radius: 30.r,
                                  child: doc.image!=null?CachedNetworkImage(
                                    imageUrl: "${AppConstants.imageBaseUrl}/${doc.image!}",
                                    height: 92.h,
                                    width: 82.w,
                                    fit: BoxFit.contain,
                                    placeholder: (context, url) => Container(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator(
                                        color: AppColors.appColor,
                                      ),
                                    ),
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
                                  ),),
                                  title: Text(
                                      "${doc.name}",style: getSemiBoldStyle(color: Colors.black,fontSize: MyFonts.size18),),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${controller.state.completedAppointmentList[index].selectedDate}",style: getSemiBoldStyle(color: Colors.black26,fontSize: MyFonts.size18),),
                                          padding5,
                                          Container(width: 0.6.w,height: 10.h,color: Colors.black26,),
                                          padding5,
                                          Text(
                                            "${controller.state.completedAppointmentList[index].selectedTimeSlot}",style: getSemiBoldStyle(color: Colors.black26,fontSize: MyFonts.size18),),
                                        ],
                                      ),
                                      padding10,
                                      Row(
                                        children: [
                                          Text("Status",style: getSemiBoldStyle(color: Colors.black26,fontSize: MyFonts.size14),),
                                          padding5,
                                          Text("Completed",style: getSemiBoldStyle(color: AppColors.appColor,fontSize: MyFonts.size14),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })
                        : Center(
                            child: Text(
                              "No completed appointments yet",
                              style: getBoldStyle(
                                  color: AppColors.appColor,
                                  fontSize: MyFonts.size24),
                            ),
                          ),
              ))),
    );
  }
}
