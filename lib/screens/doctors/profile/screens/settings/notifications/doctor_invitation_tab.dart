
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/settings/notifications/widgets/view.dart';
import 'package:imedics_latest/utils/app_assets.dart';

class DInvitationSection extends StatelessWidget {
  const DInvitationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 812.h,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const DInvitationCard(
                      title: 'Anna  Kowalsky',
                      time: '19 July 2023',
                      image: AppAssets.doctorpro);
                })
          ]),
        ),
      ),
    );
  }
}
