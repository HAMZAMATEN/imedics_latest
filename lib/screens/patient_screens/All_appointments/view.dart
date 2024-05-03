

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/controller.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/widgets/completed_appointments.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/widgets/upcoming_appointments.dart';
import 'package:imedics_latest/screens/patient_screens/auth_screens/controller.dart';
import 'package:imedics_latest/screens/patient_screens/auth_screens/login/view.dart';
import 'package:imedics_latest/screens/patient_screens/auth_screens/signup/view.dart';
import 'package:imedics_latest/screens/patient_screens/home/controller.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class AllAppointmentsTabView extends StatefulWidget {
  UserHomeController controller;
   AllAppointmentsTabView({super.key,required this.controller});

  @override
  State<AllAppointmentsTabView> createState() => _AllAppointmentsTabViewState();
}

class _AllAppointmentsTabViewState extends State<AllAppointmentsTabView>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabViewController());
    final appointController = Get.put(AllAppointmentController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   title: Text("Appointment",style: getBoldStyle(color: Colors.black,fontSize: MyFonts.size16),),
        //   centerTitle: true,
        //   leading: IconButton(onPressed: (){
        //     Get.back();
        //   }, icon: Icon(Icons.arrow_back_ios,size: 20.sp,)),
        // ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.appColor1,
                AppColors.appColor,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height:20.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(onPressed: (){
                                    Get.back();
                                  }, icon: Icon(Icons.arrow_back_ios,size: 20.sp,color: Colors.white,)),
                                  SizedBox(width: 60.w,),
                                  Text("Appointment",style: getBoldStyle(color: Colors.white,fontSize: MyFonts.size20),),
                                  // Container(width: 10,),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              // Text(
                              //   'Go Ahead & Set Up\nYour Account',
                              //   style: getBoldStyle(
                              //       color: AppColors.white,
                              //       fontSize: MyFonts.size26),
                              // ),
                              // padding10,
                              // Text(
                              //   'Sign In-Up To Enjoy The Best Doctor\nConsultation Experience',
                              //   style: getSemiBoldStyle(
                              //       color: AppColors.white,
                              //       fontSize: MyFonts.size14),
                              // ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: 1.sw,
                  decoration: const BoxDecoration(
                    color: AppColors.lightBg,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: AppColors.lightgrey,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: TabBar(
                            indicatorPadding: EdgeInsets.zero,
                            dividerColor: Colors.transparent,
                            indicatorColor: Colors.transparent,
                            controller: _tabController,
                            // give the indicator a decoration (color and border radius)
                            indicator: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                AppColors.appColor1,
                                AppColors.appColor,
                              ]),
                              borderRadius: BorderRadius.circular(
                                25.sp,
                              ),
                              color: Colors.green,
                            ),
                            labelColor: AppColors.white,
                            labelStyle: getSemiBoldStyle(
                                color: AppColors.white,
                                fontSize: MyFonts.size14
                            ),
                            labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
                            unselectedLabelColor: AppColors.grey,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            tabs: [
                              Tab(
                                child: SizedBox(
                                  // width: 170.w,
                                  child: const Center(child: Text('Upcoming')),
                                ),
                              ),
                              Tab(
                                child: SizedBox(
                                  // width: 170.w,
                                  child: const Center(child: Text('Completed')),
                                ),
                              ),
                              // Tab(
                              //   child: SizedBox(
                              //     // width: 170.w,
                              //     child: const Center(child: Text('Cancelled')),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children:  [
                                UpComingAppointmentsView(controller: widget.controller,appointController: appointController,),
                                CompletedAppointmentsView(controller: widget.controller,appointController: appointController,),
                                // Container(),

                                // TabLogin(
                                //   isdoctor: false,
                                // ),
                                // TabSignIn(),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
