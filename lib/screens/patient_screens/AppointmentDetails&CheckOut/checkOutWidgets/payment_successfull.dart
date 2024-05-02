
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/controller.dart';
import 'package:imedics_latest/screens/patient_screens/applicationScreens/view.dart';
import 'package:imedics_latest/utils/app_paddings.dart';

class PaymentSuccessfullWidget extends StatelessWidget {
  SetAppointmentDetailsController appController;
  PaymentSuccessfullWidget({super.key,required this.appController});

  // final controller = Get.put(UserHomeScreenProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff222A48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: AppColors.appColor1.withOpacity(0.20),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.appColor1.withOpacity(0.80),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.white,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.appColor1.withOpacity(0.90),
                    child: const Center(
                      child: Icon(
                        Icons.done,
                        color: AppColors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            padding24,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Payment Successful',
                  style: getBoldStyle(color: Colors.white, fontSize: 22),
                ),
              ],
            ),
            padding24,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You have successfully booked\nappointement with ${appController.state.docName.value}',
                  textAlign: TextAlign.center,
                  style: getBoldStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            padding40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff5EEF8F),
                                Color(0xff00A69D),
                              ],
                            ),
                            shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(4.w),
                          child: Icon(Icons.calendar_month,color: Colors.white,),
                        )),
                    SizedBox(height:5.h),
                    Text('${appController.state.date.value} ${appController.state.monthName.value}, ${appController.state.year.value}',style: TextStyle(color: Colors.white),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff5EEF8F),
                                Color(0xff00A69D),
                              ],
                            ),
                            shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(4.w),
                          child: Icon(Icons.alarm,color: Colors.white,),
                        )),
                    SizedBox(height:5.h),
                    Text('${appController.state.time.value}',style: TextStyle(color: Colors.white),),
                  ],
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                  onPressed: () {
                    Get.offAll(()=>UserApplicationView());
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => UserMainMenuScreen()));
                  },
                  buttonText: 'View Appointment'),
            )
          ],
        ),
      ),
    );
  }
}
