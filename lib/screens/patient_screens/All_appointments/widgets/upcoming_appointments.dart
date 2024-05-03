import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/controller.dart';
import 'package:imedics_latest/screens/patient_screens/home/controller.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

import 'appointment_card_widget.dart';

class UpComingAppointmentsView extends StatelessWidget {
  UserHomeController controller;
  AllAppointmentController appointController;
  UpComingAppointmentsView({super.key,required this.controller,required this.appointController});

  @override
  Widget build(BuildContext context) {
    print("Length");
    print(controller.state.patientAppointmentList.length);
    return Container(
      height: 600.h,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
          itemCount:controller.state.patientAppointmentList.length,
          itemBuilder: (context,index)
    {
      return appointmentCardWidget(controller,index,appointController,controller.state.patientAppointmentList,false);
    }
    )
    );
  }
}
