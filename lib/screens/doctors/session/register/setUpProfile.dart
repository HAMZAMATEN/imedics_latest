// ignore_for_file: prefer_const_constructors, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/session/register/controller.dart';
import 'package:imedics_latest/screens/doctors/session/register/screens/basic_information_screen.dart';
import 'package:imedics_latest/screens/doctors/session/register/screens/consulatation_time_view.dart';
import 'package:imedics_latest/screens/doctors/session/register/screens/doctor_profile_view.dart';
import 'package:imedics_latest/screens/doctors/session/register/screens/education_and_experience.dart';
import 'package:imedics_latest/screens/doctors/session/register/widgets/view.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class SetupIndividualProfileView extends StatefulWidget {
  SetupIndividualProfileView({super.key, required this.isofficedoctor});

  bool isofficedoctor = false;

  @override
  State<SetupIndividualProfileView> createState() =>
      _SetupIndividualProfileViewState();
}

class _SetupIndividualProfileViewState extends State<SetupIndividualProfileView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final contoller = Get.put(IndividualDoctorRegisterController());

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor1,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text('Setup Your Profile',
            style:
                getBoldStyle(color: AppColors.black, fontSize: MyFonts.size20)),
      ),
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
                      top: 10.h,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRect(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [0, 1, 2, 3].map((e) {
                                    double maxWidth =
                                        MediaQuery.of(context).size.width / 6;
                                    double maxWidth3 =
                                        MediaQuery.of(context).size.width / 2.6;
                                    double maxWidth2 =
                                        MediaQuery.of(context).size.width / 8;

                                    return Obx(
                                      () => AnimatedContainer(
                                        duration: const Duration(seconds: 1),
                                        width: e ==
                                                contoller
                                                    .state.selectdpage.value
                                            ? maxWidth3
                                            : e == 3
                                                ? maxWidth2
                                                : maxWidth,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 12,
                                              backgroundColor: AppColors.white,
                                              child: contoller.state.selectdpage
                                                          .value !=
                                                      e
                                                  ? Container()
                                                  : const CircleAvatar(
                                                      radius: 8,
                                                      backgroundColor:
                                                          AppColors.appColor1,
                                                    ),
                                            ),
                                            padding4,
                                            if (e ==
                                                contoller
                                                    .state.selectdpage.value)
                                              Expanded(
                                                child: Text(
                                                  widget.isofficedoctor == true
                                                      ? officedoctorregistrationTabsNames[
                                                          e]
                                                      : doctorregistrationTabsNames[
                                                          e],
                                                  style: getSemiBoldStyle(
                                                    color: AppColors.white,
                                                    fontSize: MyFonts.size12,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              )
                                            else
                                              e == 3
                                                  ? Container()
                                                  : Expanded(
                                                      child:
                                                          buildDottedDivider()),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Obx(
              () => Expanded(
                  flex: 7,
                  child: widget.isofficedoctor == true
                      ? office_doctor_registrationTabsPages[
                          contoller.state.selectdpage.value]
                      : doctorregistrationTabsPages[
                          contoller.state.selectdpage.value]),
            )
          ],
        ),
      ),
    );
  }

  late List doctorregistrationTabsPages = [
    BasicInformationView(
        onPressed: () => contoller.changescreen(1),
        onPressedback: () {
          Navigator.pop(context);
        }),
    EducationAndExpirienceView(
        onPressed: () => contoller.changescreen(2),
        onPressedback: () => contoller.changescreen(0)),
    ConsultationTimeView(
      onPressed: () => contoller.changescreen(3),
      onPressedback: () => contoller.changescreen(1),
    ),
    DoctorProfileView(
      onPressedback: () {
        contoller.changescreen(3);
      },
    ),
  ];

  // ignore: non_constant_identifier_names
  late List office_doctor_registrationTabsPages = [
    // Office_BasicInformation(onPressed: () => changescreen(1)),
    // Office_EducationAndExeience(onPressed: () => changescreen(2)),
    // Office_ConsultaionandTime(onPressed: () => changescreen(3)),
    // Office_DoctorProfile()
  ];
}

List doctorregistrationTabsNames = [
  'Basic Information',
  'Education & Experience',
  'Consultation fee & time',
  'Review Profile'
];

List officedoctorregistrationTabsNames = [
  'Basic Information',
  'Office Type & Location',
  'Add doctor in your office',
  'Review Profile'
];
