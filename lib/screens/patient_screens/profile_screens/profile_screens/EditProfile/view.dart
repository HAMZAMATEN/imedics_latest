import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/profile_screens/profile_screens/EditProfile/controller.dart';
import 'package:imedics_latest/screens/patient_screens/profile_screens/widgets/profile_picture.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
   return  Scaffold(
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(onPressed: (){
                                  Get.back();
                                }, icon: Icon(Icons.arrow_back_ios),color: Colors.white,),
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
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 1.sw,
                      height: MediaQuery.of(context).size.height,
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
                                height: 80.h,
                              ),
                              TextFormField(
                                controller: controller.state.nameController,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabled: true,
                                    prefixIcon: Icon(Icons.person_outline,color: AppColors.appColor),
                                    hintText: "Username",
                                    hintStyle: getLightStyle(color: Colors.black26),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(100),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        )
                                    )
                                ),
                              ),
                              padding20,
                              TextFormField(
                                controller: controller.state.eMailController,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabled: false,
                                    prefixIcon: Icon(Icons.email,color: AppColors.appColor,),
                                    hintText: "Email",
                                    hintStyle: getLightStyle(color: Colors.black26),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(100),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        )
                                    )
                                ),
                              ),

                              padding35,
                              SizedBox(
                                height: 30,
                              ),
                              padding80,

                            ],
                          ),
                        ),
                      ),
                    ),
                    ProfilePicWidget(
                      onPressed: (){},
                      picturepath: 'assets/images/whiteman.png',
                    ),
                    Padding(
                      padding:  EdgeInsets.all(20.w),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          onPressed: (){},
                          buttonText: "Save Changes",
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: Stack(
    //     clipBehavior: Clip.none,
    //     children: [
    //       Container(
    //         width: 1.sw,
    //         decoration: const BoxDecoration(
    //           color: AppColors.lightBg,
    //           borderRadius: BorderRadius.only(
    //               topLeft: Radius.circular(30), topRight: Radius.circular(30)),
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.all(18.0),
    //           child: SingleChildScrollView(
    //             child: Column(
    //               children: [
    //                 SizedBox(
    //                   height: 30,
    //                 ),
    //                 padding35,
    //                 SizedBox(
    //                   height: 30,
    //                 ),
    //                 padding80
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //       ProfilePicWidget(
    //         onPressed: (){},
    //         picturepath: 'assets/images/whiteman.png',
    //       )
    //     ],
    //   )
    // );
  }
}
