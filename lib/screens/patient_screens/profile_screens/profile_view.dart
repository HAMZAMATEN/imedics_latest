import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/loadingDialogue.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/helpers/shared_prefrences.dart';
import 'package:imedics_latest/screens/common/accountType/view.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/information_center.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/settings/setting_view.dart';
import 'package:imedics_latest/screens/patient_screens/profile_screens/profile_screens/EditProfile/view.dart';
import 'package:imedics_latest/screens/patient_screens/profile_screens/profile_screens/wallet_screen/view.dart';
import 'package:imedics_latest/screens/patient_screens/profile_screens/widgets/profile_picture.dart';
import 'package:imedics_latest/screens/patient_screens/profile_screens/widgets/profile_tile.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.appColor1,
                AppColors.appColor,
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 90.w, top: 50.h),
                      child: Image.asset(
                        AppAssets.loginBg,
                        height: 272.h,
                        width: 307.7.w,
                        color: AppColors.white.withOpacity(0.1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Image.asset(
                        AppAssets.bgGradient,
                      ),
                    ),
                    Positioned(
                      top: 30.h,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Profile',
                                  style: getBoldStyle(
                                      color: AppColors.white,
                                      fontSize: MyFonts.size26),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: buildDoctorProfileFields()),
          ],
        ),
      ),
    );
  }
}


class buildDoctorProfileFields extends StatefulWidget {
  buildDoctorProfileFields(
      {super.key});


  @override
  State<buildDoctorProfileFields> createState() =>
      _buildDoctorProfileFieldsState();
}

class _buildDoctorProfileFieldsState extends State<buildDoctorProfileFields> {
  final TextEditingController namecontroller = TextEditingController();

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 1.sw,
          decoration:  BoxDecoration(
            color: AppColors.bgColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  padding35,
                  Text('${AppConstants.userName}',style: getSemiBoldStyle(color: Colors.black26,fontSize: MyFonts.size18),),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text('${AppConstants.userEmail}',style: getSemiBoldStyle(color: Colors.black26,fontSize: MyFonts.size16),),
                  SizedBox(
                    height: 15.h,
                  ),
                  ProfileTile(
                    index: 0,
                    onPressed: () {
                      Get.to(()=>EditProfileView());
                    },
                    text: "My Profile",
                  ),
                  // ProfileTile(
                  //   index: 1,
                  //   onPressed: () {
                  //     Get.to(()=>WalletView());
                  //   },
                  //   text: "My Wallet",
                  // ),
                  // ProfileTile(
                  //   index: 2,
                  //   onPressed: () {
                  //     // Navigator.pushNamed(context, AppRoutes.addPaymentMethod);
                  //   },
                  //   text: "Payment Method",
                  // ),
                  ProfileTile(
                    index: 3,
                    onPressed: () {
                      Get.to(()=>SettingsView());
                      // Navigator.pushNamed(
                      //     context, AppRoutes.settingsPageScreen);
                    },
                    text: "Settings",
                  ),
                  ProfileTile(
                    index: 4,
                    onPressed: () {
                      Get.to(()=>InformationCenter());
                    },
                    text: "Help Center",
                  ),
                  ProfileTile(
                    index: 5,
                    onPressed: () {
                      Get.to(()=>InformationCenter());
                    },
                    text: "Information Center",
                  ),
                  ProfileTile(
                    index: 6,
                    onPressed: () async{
                      await showAppLoading(context);
                      await Future.delayed(
                          Duration(seconds: 2),() async{
                        AppConstants.clearUserValues();
                        await Prefrences().saveUserId('');
                        Navigator.pop(context);
                        Get.offAll(
                              () => AccountTypeScreen(),
                        );
                      });

                    },
                    text: "Log out",
                  ),
                  SizedBox(height:300.h),
                ],
              ),
            ),
          ),
        ),
        ProfilePicWidget(
          onPressed: (){},
          picturepath: 'assets/images/whiteman.png',
        )
      ],
    );
  }
}
