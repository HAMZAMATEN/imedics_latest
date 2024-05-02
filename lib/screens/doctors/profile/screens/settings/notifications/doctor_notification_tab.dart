import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/settings/notifications/widgets/view.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class DNotificationSection extends StatelessWidget {
  const DNotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 812.h,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    today,
                    style: getMediumStyle(
                        color: AppColors.black, fontSize: MyFonts.size18),
                  ),
                  padding10,
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const DNotificationCard(
                          image: AppAssets.doctorpro,
                          title: 'Jessica Month',
                          subTitle: 'New Appointment',
                          time: 'July 20, 11:20-11:50',
                        );
                      }),
                  Text(
                    yesterday,
                    style: getMediumStyle(
                        color: AppColors.black, fontSize: MyFonts.size18),
                  ),
                  padding10,
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const DNotificationCard(
                          image: AppAssets.doctorpro,
                          title: 'Jessica Month',
                          subTitle: 'New Appointment',
                          time: 'July 20, 11:20-11:50',
                        );
                      }),
                ]),
          ),
        ),
      ),
    );
  }
}
