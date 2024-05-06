import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/All_Specialization/widgets/specialization_serach_widget.dart';
import 'package:imedics_latest/screens/patient_screens/All_Specialization/widgets/specialized_doctors_view.dart';
import 'package:imedics_latest/screens/patient_screens/home/controller.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class AllSpecializationView extends StatelessWidget {
  UserHomeController controller;
  AllSpecializationView({super.key,required this.controller});

  final List<String> _specialList = [
    'Heart Specialist',
    'Neurologist',
    'Eye Specialist',
    'Dentist',
    'Gynecologist',
    'Orthopedic',
    'Urologist',
    'Otology',
    'Pediatric',
    'Skin Specialist',
    'Gastroenterology',
    'General',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Our Specialization",style: getBoldStyle(color: Colors.black,fontSize: MyFonts.size16),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,size: 20.sp,)),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              padding10,
              specializationSearchWidget(),
              padding10,
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 10.h),
                  shrinkWrap: true,
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      crossAxisCount: 3,
                      mainAxisExtent: 113.h),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        Get.to(()=>SpecializedDoctorsView(controller: controller, specialization: _specialList[index]));
                      },
                      child: Column(
                        children: [
                          Container(
                              // height: 87.h,
                              // width: 108.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/sp${index + 1}.png',
                                    fit: BoxFit.contain,
                                    height: 56.h,
                                    width: 56.w,
                                  ),
                                ],
                              )),
                          padding8,
                          Text(
                            _specialList[index],
                            style: getSemiBoldStyle(
                                color: AppColors.black, fontSize: MyFonts.size10),
                          )
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
