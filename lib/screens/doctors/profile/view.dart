import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/common/accountType/view.dart';
import 'package:imedics_latest/screens/doctors/profile/controller.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/join_office.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/myProfile.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/settings/setting_view.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/wallet/wallet_view.dart';
import 'package:imedics_latest/screens/doctors/profile/widgets/view.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class DoctorProfileView extends StatefulWidget {
  const DoctorProfileView({super.key});

  @override
  State<DoctorProfileView> createState() => _DoctorProfileViewState();
}

class _DoctorProfileViewState extends State<DoctorProfileView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    log('init from hello');
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  int selectdpage = 0;

  // final profileController = Get.put(DoctorProfileController());

  final doctorProfileController = Get.put(DoctorProfileController());

  @override
  Widget build(BuildContext context) {
    log('hello from profile');
    // final mainMenuCtr = ref.watch(dProfileMainprovider);

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
                                  // mainMenuCtr.isedit == true
                                  //     ? 'Edit Profile'
                                  //     :
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
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 1.sw,
                    decoration: const BoxDecoration(
                      color: AppColors.lightBg,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            padding35,
                            // Text("No details available"),
                            Text(
                              AppConstants.docName,
                              style: getBoldStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              AppConstants.docEmail,
                              style: getSemiBoldStyle(
                                fontSize: 14.sp,
                                color: Color.fromRGBO(136, 136, 136, 1),
                              ),
                            ),
                            // Obx(() {
                            //   if (controller.SpecificDoctorDetailsList.isEmpty) {
                            //     return Text("No details available");
                            //   } else {
                            //     final details =
                            //         controller.SpecificDoctorDetailsList.first;
                            //     return Column(
                            //       children: [
                            //         Text("${details.name}"),
                            //         Text("${details.email}"),
                            //         Text("${details.sId}"),
                            //       ],
                            //     );
                            //   }
                            // }),

                            DoctorProfileTile(
                              index: 0,
                              onPressed: () {
                                Get.to(
                                  () => MyProfileView(),
                                );
                              },
                              text: "My Profile",
                            ),
                            DoctorProfileTile(
                              index: 1,
                              onPressed: () {
                                Get.to(
                                  () => DoctorWalletView(),
                                );
                              },
                              text: "My Wallet",
                            ),
                            AppConstants.doctorAccountType == 1
                                ? Container()
                                : DoctorProfileTile(
                                    index: 2,
                                    onPressed: () {
                                      Get.to(
                                        () => JoinOfficePage(),
                                      );
                                    },
                                    text: "Join Office",
                                  ),
                            DoctorProfileTile(
                              index: 3,
                              onPressed: () {},
                              text: "Payment Method",
                            ),
                            DoctorProfileTile(
                              index: 4,
                              onPressed: () {
                                Get.to(
                                  () => SettingsView(),
                                );
                              },
                              text: "Settings",
                            ),
                            // DoctorProfileTile(
                            //   index: 5,
                            //   onPressed: () {},
                            //   text: "Help Center",
                            // ),
                            DoctorProfileTile(
                              index: 5,
                              onPressed: () {},
                              text: "Information Center",
                            ),

                            Obx(
                              () =>
                                  doctorProfileController.state.loading.value ==
                                          true
                                      ? ShowProgressIndicator()
                                      : DoctorProfileTile(
                                          index: 6,
                                          onPressed: () async {
                                            doctorProfileController.logout();
                                            // controller.clearDoctorDetails();
                                            // await Global().removeUserId(context);
                                          },
                                          text: "Log Out",
                                        ),
                            ),
                            padding80
                          ],
                        ),
                      ),
                    ),
                  ),
                  CommonpositionPicture(
                      onPressed: () {},
                      picturepath:
                          // widget.isuser == false
                          //     ?
                          'assets/images/whiteman.png'
                      // : AppAssets.doctorpro,
                      )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
