import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/screens/doctors/home/next_appointment/appointment_card.dart';

class CancelTabView extends StatelessWidget {
  const CancelTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: ListView.builder(
          padding: EdgeInsets.only(top: 10.h),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: AppointmentCardReused(
                cancelationReason: (){},
              ),
            );
          }),
    );
  }
}
