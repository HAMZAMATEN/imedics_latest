import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/screens/patient_screens/home/controller.dart';
import 'package:imedics_latest/screens/patient_screens/home/widgets/doctorCard.dart';
import 'package:shimmer/shimmer.dart';

Widget doctorsList(BuildContext context,UserHomeController controller){
  return Obx(() => Container(
    height: MediaQuery.of(context).size.height/2,
    child: controller.state.docListFetchLoading.value==false?ListView.builder(
        itemCount: controller.state.doctorsList.length,
        itemBuilder: (context,index){
          try{
            Random random = Random();
            int rat = random.nextInt(5) + 1;
            int revi = random.nextInt(1000) + 1;
            return Padding(
              padding:  EdgeInsets.only(top: 5.h),
              child: doctorListCard(
                doctor: controller.state.doctorsList[index],
                rating: double.parse(rat.toString()),
                review: "${revi} satisfied",
              ),
            );
          }catch(e){

          }

        }):
      Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context,index){
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
            }
        ),)
    ,
  ));
}