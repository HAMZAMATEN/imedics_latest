import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/screens/patient_screens/home/widgets/doctorCard.dart';

Widget doctorsList(BuildContext context){
  return Container(
    height: MediaQuery.of(context).size.height/2,
    child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context,index){
      return Padding(
        padding:  EdgeInsets.only(top: 5.h),
        child: doctorListCard(
            image: "",
            name: "Dr.Zain",
            speciality: "CardeoMetabolic Specialist",
            rating: 4.5,
            review: "3456 satisfied",
           id: 'id',
        ),
      );
    }),
  );
}