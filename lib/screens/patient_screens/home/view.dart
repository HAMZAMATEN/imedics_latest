import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/patient_screens/All_Doctors/view.dart';
import 'package:imedics_latest/screens/patient_screens/All_Specialization/view.dart';
import 'package:imedics_latest/screens/patient_screens/All_Specialization/widgets/specialized_doctors_view.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/view.dart';
import 'package:imedics_latest/screens/patient_screens/home/controller.dart';
import 'package:imedics_latest/screens/patient_screens/home/video_call_page.dart';
import 'package:imedics_latest/screens/patient_screens/home/widgets/doctors_list_widget.dart';
import 'package:imedics_latest/screens/patient_screens/home/widgets/specialization_catoger_widget.dart';
import 'package:imedics_latest/screens/patient_screens/home/widgets/userHomeNameWidget.dart';
import 'package:imedics_latest/screens/patient_screens/home/widgets/userSearchWidget.dart';
import 'package:imedics_latest/screens/patient_screens/home/widgets/user_next_appointment_widget.dart';
import 'package:imedics_latest/screens/patient_screens/home/widgets/vide_call_2.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserHomeController());
    controller.fetchPatientAppointments();
    controller.fetchAllDoctors();
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical:20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  padding8,
                  // InkWell(
                  //     onTap:(){Get.to(()=>CallPage());},
                  //     child: Text("Call")),
                  // padding8,
                  // InkWell(
                  //     onTap:(){Get.to(()=>CallPage2());},
                  //     child: Text("Call 2")),
                  userHomeNameWidget(),
                  padding16,
                  userSearchWidget(controller),
                  padding18,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Our Specialization",style: getSemiBoldStyle(color: Colors.black,fontSize: MyFonts.size16),),
                      InkWell(
                          onTap: (){
                            Get.to(()=>AllSpecializationView(controller: controller));
                          },
                          child: Text("See All",style: getBoldStyle(color: AppColors.appColor,fontSize: MyFonts.size16),)),
                    ],
                  ),
                  padding12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    specializationWidget(name: 'Heart Specialist', imagePath: 'sp1.png',onTap: (){
                      Get.to(()=>SpecializedDoctorsView(controller: controller, specialization: 'Heart Specialist'));
                    }),
                      specializationWidget(name: 'Neurologist', imagePath: 'sp2.png',onTap: (){
                        Get.to(()=>SpecializedDoctorsView(controller: controller, specialization: 'Neurologist'));
                      }),
                      specializationWidget(name: 'Eye Specialist', imagePath: 'sp3.png',onTap: (){
                        Get.to(()=>SpecializedDoctorsView(controller: controller, specialization: 'Eye Specialist'));
                      }),

                    ],
                  ),
                  padding12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Next Appointment",style: getSemiBoldStyle(color: Colors.black,fontSize: MyFonts.size16),),
                      InkWell(
                          onTap: (){
                            Get.to(()=>AllAppointmentsTabView(controller: controller,));
                          },
                          child: Text("See All",style: getBoldStyle(color: AppColors.appColor,fontSize: MyFonts.size16),)),
                    ],
                  ),
                  padding12,
                  userNextAppointmentCard(controller),
                  // UNextAppointmentWidget(),
                  padding16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Popular Doctors",style: getSemiBoldStyle(color: Colors.black,fontSize: MyFonts.size16),),
                      InkWell(
                          onTap: (){
                            Get.to(()=>AllDcotorsView(controller: controller,));
                          },
                          child: Text("See All",style: getBoldStyle(color: AppColors.appColor,fontSize: MyFonts.size16),)),
                    ],
                  ),
                  padding16,
                  doctorsList(context,controller),
                  // const UpopularDoctor(),
                  // padding8,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
