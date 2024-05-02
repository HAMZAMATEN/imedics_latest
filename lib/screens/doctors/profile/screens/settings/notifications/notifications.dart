import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/settings/notifications/doctor_invitation_tab.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/settings/notifications/doctor_notification_tab.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class DoctorNotificationsView extends StatelessWidget {
  const DoctorNotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(246, 251, 250, 1),
          appBar: AppBar(
              toolbarHeight: 120.h,
              backgroundColor: Color.fromRGBO(246, 251, 250, 1),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20.h,
                  color: AppColors.black94,
                ),
              ),
              centerTitle: true,
              title: Text(
                notification,
                style: getSemiBoldStyle(
                    color: AppColors.black94, fontSize: MyFonts.size18),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Container(
                          height: 40.h,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(246, 251, 250, 1),
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 0.8))),
                          child: TabBar(

                            unselectedLabelColor: AppColors.black,
                            unselectedLabelStyle: getMediumStyle(
                                color: AppColors.black,
                                fontSize: MyFonts.size16),
                            labelColor: AppColors.black,
                            labelStyle: getMediumStyle(
                                color: AppColors.black,
                                fontSize: MyFonts.size16),
                            indicatorColor: Colors.blue,
                            indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(
                                  color: AppColors.appColor, width: 2.0),
                            ),
                            tabs: const [
                              Text(
                                notification,
                              ),
                              Text(
                                invitation,
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              )),
          body: const TabBarView(
            children: [DNotificationSection(), DInvitationSection()],
          )),
    );
  }
}
