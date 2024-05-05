// import 'package:date_picker_timeline/extra/color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/settings/change_password.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/settings/notifications/notifications.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20.h,
            color: AppColors.black94,
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          'Settings',
          style: getSemiBoldStyle(
              color: AppColors.black94, fontSize: MyFonts.size18),
        ),
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage(AppAssets.homeBg),
          //   fit: BoxFit.cover,
          // ),
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              ListTile(
                onTap: (){
                  Get.to(() => ChangePasswordView(),);
                },
                leading: Image.asset(
                  'assets/images/rightuser.png',
                  color: AppColors.appColor,
                ),
                title: Text(
                  'Change Password',
                  style: getSemiBoldStyle(color: Colors.black, fontSize: 16),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.appColor,
                ),
              ),
              // Divider(
              //   color: AppColors.grey.withOpacity(0.30),
              // ),
              // ListTile(
              //   onTap: (){
              //     Get.to(() => DoctorNotificationsView(),);
              //   },
              //   leading: Image.asset(
              //     'assets/images/notification.png',
              //     color: AppColors.appColor,
              //   ),
              //   title: Text(
              //     'Notification Settings',
              //     style: getSemiBoldStyle(color: Colors.black, fontSize: 16),
              //   ),
              //   trailing: const Icon(
              //     Icons.arrow_forward_ios,
              //     color: AppColors.appColor,
              //   ),
              // ),
              Divider(
                color: AppColors.grey.withOpacity(0.30),
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/notifications.png',
                ),
                title: const Text(
                  'Delete Account',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
