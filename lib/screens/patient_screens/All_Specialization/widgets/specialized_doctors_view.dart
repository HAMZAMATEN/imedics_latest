import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/All_Specialization/controller.dart';
import 'package:imedics_latest/screens/patient_screens/All_Specialization/widgets/specialization_serach_widget.dart';
import 'package:imedics_latest/screens/patient_screens/All_Specialization/widgets/specialized_doc_card.dart';
import 'package:imedics_latest/screens/patient_screens/home/controller.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class SpecializedDoctorsView extends StatelessWidget {
  UserHomeController controller;
  String specialization;
  SpecializedDoctorsView({super.key,required this.controller,required this.specialization});
  @override
  Widget build(BuildContext context) {
    final cont = Get.put(SpecializedDoctorsController());
    cont.filterDoctors(controller, specialization);
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              padding10,
              specializationSearchWidget(),
              padding10,
              cont.state.filterLoading.value==true?Center(child: ShowProgressIndicator(),):
                  cont.state.filteredDocsList.length==0?Center(child: Padding(
                    padding:  EdgeInsets.all(20.h),
                    child: Text("No doctors found under this catogery",style: getBoldStyle(color: AppColors.appColor,fontSize: MyFonts.size22),),
                  ),):
                      Expanded(
                        child: ListView.builder(
                            itemCount: cont.state.filteredDocsList.length,
                            itemBuilder: (context,index){
                          return Padding(
                            padding:  EdgeInsets.symmetric(vertical: 8.h),
                            child: DocDetailCard(doctor: cont.state.filteredDocsList[index]),
                          );
                        }),
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
