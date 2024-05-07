import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/screens/patient_screens/SearchDoctor/view.dart';
import 'package:imedics_latest/screens/patient_screens/home/controller.dart';
import 'package:imedics_latest/utils/app_assets.dart';

Widget userSearchWidget(UserHomeController controller){
  return InkWell(
    onTap: (){
      Get.to(()=>SearchDoctorScreen(controller: controller,));
    },
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.5))
      ),
      child: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(AppAssets.search,height: 20.h,width: 20.w,),
                  SizedBox(width: 10.w,),
                  Text('Search Doctor / Condition',style: getRegularStyle(color: Colors.grey),),
                ],
              ),
              Image.asset(AppAssets.filter,height: 20.h,width: 20.w,),
            ],
          ),
        ),
      ),

    ),
  );
}