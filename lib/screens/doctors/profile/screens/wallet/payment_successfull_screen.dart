import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/session_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/application/view.dart';
import 'package:imedics_latest/screens/doctors/profile/controller.dart';
import 'package:imedics_latest/utils/app_paddings.dart';

class PaymentSuccessful extends StatelessWidget {
  PaymentSuccessful({super.key});

  final controller = Get.put(DoctorProfileController());

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
                  'Withdraw Successful',
                  style: getBoldStyle(color: Colors.white, fontSize: 22),
                ),
              ],
            ),
            padding24,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Payment will be transfer \ninto your account within 24 \nworking hours',
                  textAlign: TextAlign.center,
                  style: getBoldStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            padding40,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SessionButton(
                  back: () {},
                  onPressed: () {
                    Get.offAll(() => DoctorApplicationView());
                  },
                  isbackbuton: false,
                  text: 'Back to Home'),
            )
          ],
        ),
      ),
    );
  }
}
