import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/All_Doctors/all_doc_card.dart';
import 'package:imedics_latest/screens/patient_screens/home/controller.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class AllDcotorsView extends StatelessWidget {
  UserHomeController controller;
   AllDcotorsView({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Available Doctors",style: getBoldStyle(color: Colors.black,fontSize: MyFonts.size16),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,size: 20.sp,)),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(10.h),
          child: ListView.builder(
            itemCount: controller.state.doctorsList.length,
            itemBuilder: (context,index){
          return Padding(
            padding:  EdgeInsets.symmetric(vertical: 6.h),
            child: AllDocCard(doctor: controller.state.doctorsList[index]),
          );
                },),
        ),),
    );
  }
}
