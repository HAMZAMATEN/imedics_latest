import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/controller.dart';
import 'package:imedics_latest/screens/patient_screens/home/controller.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/appoint_book_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

Widget appointmentCardWidget(UserHomeController controller,int index,AllAppointmentController appointController,List<PatientAppointmentModel> listOfApp,bool isCompleted){
  UserDocModel doc = isCompleted==true?  appointController.getUpComingAppointDoc(controller, controller.state.completedAppointmentList[index].docId!)
      : appointController.getUpComingAppointDoc(controller, controller.state.patientAppointmentList[index].docId!);
  return Padding(
    padding:  EdgeInsets.symmetric(vertical: 5.h),
    child: InkWell(
      onTap:(){},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        // height: 160.h,
        // width: double.infinity,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${doc.name}",style: getBoldStyle(color: Colors.black,fontSize: MyFonts.size16),),
              padding5,
              Text("${doc.specialization} ",style: getBoldStyle(color: Colors.black,fontSize: MyFonts.size16),),
              padding10,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_month,color: AppColors.appColor,),
                      padding5,
                      Text("${listOfApp[index].selectedTimeSlot}",style: getBoldStyle(color: Colors.black,fontSize: MyFonts.size16),),
                    ],
                  ),
                  padding5,
                  Row(
                    children: [
                      Icon(Icons.calendar_month,color: AppColors.appColor,),
                      padding5,
                      Text("${listOfApp[index].selectedDate}",style: getBoldStyle(color: Colors.black,fontSize: MyFonts.size16),),
                    ],
                  ),
                ],
              ),
              padding5,
             isCompleted ==false ? CustomButton(buttonText: "Cancel",backColor: Colors.white,textColor: Colors.black,borderColor: Colors.black12,):Container(),
              isCompleted==false ? Divider(color: Colors.black12,):Container(),
              isCompleted==false? CustomButton(buttonText: "Reschedule"):Container(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     CustomButton(buttonText: "Cancel",backColor: Colors.white,textColor: Colors.black,),
              //     SizedBox(width: 10.w,),
              //     CustomButton(buttonText: "Reschedule"),
              //   ],
              // )
            ],
          ),
        ),
      ),
    ),
  );

}