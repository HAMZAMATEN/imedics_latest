import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/session/register/controller.dart';
import 'package:imedics_latest/screens/doctors/session/register/screens/tab_view/AboutTabView.dart';
import 'package:imedics_latest/screens/doctors/session/register/screens/tab_view/timing_view.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class DoctorProfileView extends StatelessWidget {
  DoctorProfileView({super.key, required this.onPressedback});
  final VoidCallback onPressedback;

  final TextEditingController namecontroller = TextEditingController();
  final cotroller = Get.put(IndividualDoctorRegisterController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 1.sw,
          decoration: const BoxDecoration(
            color: AppColors.lightBg,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              child: Column(
                children: [
                  padding80,
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Container(
                        width: 1.sw,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: Colors.transparent),
                        child: Column(
                          children: [
                            Text(
                              'Dr. Maria Elena',
                              style: getBoldStyle(
                                  color: AppColors.black,
                                  fontSize: MyFonts.size20),
                            ),
                            padding6,
                            Text(
                              'Psychologist, M.B.B.S., F.C.P.S (Psychology)',
                              style: getSemiBoldStyle(
                                  color: AppColors.grey,
                                  fontSize: MyFonts.size14),
                            ),
                            padding6,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Under 15 Min',
                                      style: getSemiBoldStyle(
                                          color: AppColors.appColor,
                                          fontSize: MyFonts.size16),
                                    ),
                                    Text(
                                      'WAIT TIME',
                                      style: getSemiBoldStyle(
                                          color: AppColors.grey,
                                          fontSize: MyFonts.size12),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 43.h,
                                  width: 2.w,
                                  color: AppColors.lightgrey,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '${cotroller.state.registerIndividualDoctorYears_of_experianceCon.value.text} Years',
                                      style: getSemiBoldStyle(
                                          color: AppColors.appColor,
                                          fontSize: MyFonts.size16),
                                    ),
                                    Text(
                                      'EXPERIENCE',
                                      style: getSemiBoldStyle(
                                          color: AppColors.grey,
                                          fontSize: MyFonts.size12),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 43.h,
                                  width: 2.w,
                                  color: AppColors.lightgrey,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '0% (0)',
                                      style: getSemiBoldStyle(
                                          color: AppColors.appColor,
                                          fontSize: MyFonts.size16),
                                    ),
                                    Text(
                                      'SATISFIED',
                                      style: getSemiBoldStyle(
                                          color: AppColors.grey,
                                          fontSize: MyFonts.size12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: TabBar(
                                  dividerColor: Colors.grey.shade300,
                                  labelStyle: getBoldStyle(
                                      color: AppColors.appColor,
                                      fontSize: MyFonts.size15),
                                  unselectedLabelStyle: getBoldStyle(
                                      color: AppColors.grey,
                                      fontSize: MyFonts.size15),
                                  labelColor: AppColors.appColor,
                                  unselectedLabelColor: AppColors.grey,
                                  indicatorColor: AppColors.appColor,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  tabs: const [
                                    Tab(
                                      child: Text(
                                        '         About Me         ',
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        '            Timing            ',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  AboutDoctorTabview(
                                    isdoctor: true,
                                    aboutself: cotroller.state.registerIndividualDoctorAboutYourselfCon.text.toString(),
                                    specialization: cotroller.state.registerIndividualDoctorSpecializationCon.text.toString(),
                                    education: cotroller.state.registerIndividualDoctorEducationCon.text.toString(),
                                    conditionstreated: cotroller.state.registerIndividualDoctorCondionTretmentCon.text.toString(),
                                    name: cotroller.state.registerIndividualDoctorFullNameCon.text.toString(),
                                    // image: cotroller.state.imagePath!.path.toString(),
                                    // docId: ,
                                    // doctorSpecificDetail: [],
                                  ),
                                  TimingTabView()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -60,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 137.h,
                width: 140,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/img.png'),
                      fit: BoxFit.fill),
                  border: Border.all(color: AppColors.white, width: 1.5),
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
