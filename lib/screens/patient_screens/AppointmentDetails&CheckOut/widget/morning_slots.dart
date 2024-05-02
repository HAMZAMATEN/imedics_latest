import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/controller.dart';

Widget morningSlotRow(SetAppointmentDetailsController controller){
  return Row(
    children: [
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: (){
            // controller.setTimeValueToTrue(controller.state.Am9.value);
            controller.setTimeValueToFalse();
            controller.state.Am9.value=true;
            controller.state.time!.value= "09:00 AM";
            print("Time selected");
            print(controller.state.time.value);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.black54),
              gradient: controller.state.Am9.value==true?LinearGradient(colors: [
                Color(0xff5EEF8F),
                Color(0xff00A69D),
              ],):null,
            ),
            child: Padding(
              padding:  EdgeInsets.all(10.w),
              child: Text('09:00 AM'),
            ),
          ),
        ),
      ),
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: (){
            // controller.setTimeValueToTrue(controller.state.Am10.value);
            controller.setTimeValueToFalse();
            controller.state.Am10.value=true;
            controller.state.time!.value= "10:00 AM";
            print("Time selected");
            print(controller.state.time.value);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.black54),
              gradient: controller.state.Am10.value==true?LinearGradient(colors: [
                Color(0xff5EEF8F),
                Color(0xff00A69D),
              ],):null,
            ),
            child: Padding(
              padding:  EdgeInsets.all(10.w),
              child: Text('10:00 AM'),
            ),
          ),
        ),
      ),
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: (){
            // controller.setTimeValueToTrue(controller.state.Am11.value);
            controller.setTimeValueToFalse();
            controller.state.Am11.value=true;
            controller.state.time!.value= "11:00 AM";
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.black54),
              gradient: controller.state.Am11.value==true?LinearGradient(colors: [
                Color(0xff5EEF8F),
                Color(0xff00A69D),
              ],):null,
            ),
            child: Padding(
              padding:  EdgeInsets.all(10.w),
              child: Text('11:00 AM'),
            ),
          ),
        ),
      ),
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: (){
            // controller.setTimeValueToTrue(controller.state.Am11.value);
            controller.setTimeValueToFalse();
            controller.state.Am12.value=true;
            controller.state.time!.value= "12:00 PM";
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.black54),
              gradient: controller.state.Am12.value==true?LinearGradient(colors: [
                Color(0xff5EEF8F),
                Color(0xff00A69D),
              ],):null,
            ),
            child: Padding(
              padding:  EdgeInsets.all(10.w),
              child: Text('12:00 PM'),
            ),
          ),
        ),
      ),
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: (){
            // controller.setTimeValueToTrue(controller.state.Am11.value);
            controller.setTimeValueToFalse();
            controller.state.pm01.value=true;
            controller.state.time!.value= "01:00 PM";
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.black54),
              gradient: controller.state.pm01.value==true?LinearGradient(colors: [
                Color(0xff5EEF8F),
                Color(0xff00A69D),
              ],):null,
            ),
            child: Padding(
              padding:  EdgeInsets.all(10.w),
              child: Text('01:00 PM'),
            ),
          ),
        ),
      ),
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: (){
            // controller.setTimeValueToTrue(controller.state.Am11.value);
            controller.setTimeValueToFalse();
            controller.state.pm02.value=true;
            controller.state.time!.value= "02:00 PM";
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.black54),
              gradient: controller.state.pm02.value==true?LinearGradient(colors: [
                Color(0xff5EEF8F),
                Color(0xff00A69D),
              ],):null,
            ),
            child: Padding(
              padding:  EdgeInsets.all(10.w),
              child: Text('02:00 PM'),
            ),
          ),
        ),
      ),
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: (){
            // controller.setTimeValueToTrue(controller.state.Am11.value);
            controller.setTimeValueToFalse();
            controller.state.pm03.value=true;
            controller.state.time!.value= "03:00 PM";
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.black54),
              gradient: controller.state.pm03.value==true?LinearGradient(colors: [
                Color(0xff5EEF8F),
                Color(0xff00A69D),
              ],):null,
            ),
            child: Padding(
              padding:  EdgeInsets.all(10.w),
              child: Text('03:00 PM'),
            ),
          ),
        ),
      ),
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: (){
            // controller.setTimeValueToTrue(controller.state.Am11.value);
            controller.setTimeValueToFalse();
            controller.state.pm04.value=true;
            controller.state.time!.value= "04:00 PM";
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.black54),
              gradient: controller.state.pm04.value==true?LinearGradient(colors: [
                Color(0xff5EEF8F),
                Color(0xff00A69D),
              ],):null,
            ),
            child: Padding(
              padding:  EdgeInsets.all(10.w),
              child: Text('04:00 PM'),
            ),
          ),
        ),
      ),
    ],
  );
}