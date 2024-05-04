import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/doctors/home/controller.dart';
import 'package:imedics_latest/screens/doctors/home/next_appointment/next_appointment_screen.dart';
import 'package:imedics_latest/screens/doctors/home/widgets/view.dart';
import 'package:imedics_latest/utils/myFonts.dart';
import 'package:intl/intl.dart';

class DNextAppointmentWidget extends StatelessWidget {
  final DoctorHomeController homeController;

  const DNextAppointmentWidget({super.key, required this.homeController});

  // const DNextAppointmentWidget({super.key, required this.homeController});
  // final DoctorIndHomeProvider controller =
  @override
  Widget build(BuildContext context) {
    return
        // homeController.state.appointmentFetchLoading.value !=true
        //   ?
        Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: homeController.state.appointmentFetchLoading.value
            ? Center(
                child: ShowProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Next Appointments',
                          style: getBoldStyle(
                            color: AppColors.textColor,
                            fontSize: MyFonts.size16,
                          ),
                        ),
                        Container(
                          height: 40.h,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: AppColors.appColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Get.to(
                                  () => UserNextAppointmenyScreen(
                                    homeController: homeController,
                                    PatientNames: 'PatientNames',
                                    id: 'id',
                                    specialist: AppConstants.docSpeciality,
                                    sletedDate: 'sletedDate',
                                    seltedTime: 'seltedTime',
                                    DoctorName: AppConstants.docName,
                                  ),
                                );
                              },
                              child: Text(
                                'See All',
                                style: getRegularStyle(color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        child: homeController
                                    .state.patientAppointmentList.length ==
                                0
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            'No Appointments yet',
                                            style: getBoldStyle(
                                                color: Colors.black,
                                                fontSize: MyFonts.size18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : UDoctorNextAppointmentCard(
                                onTap: () {},
                                name: homeController.state.patientModel.username
                                    .toString(),
                                // name: 'Dr. ${details.name.toString() == '' ? 'John' : details.name.toString()}',
                                // specialist: details.specialization.toString() == '' ? 'hu' : details.specialization.toString(),
                                specialist: homeController.state.patientModel.email
                                    .toString(),
                                image: 'assets/images/whiteman.png',
                                // rating: 5,
                                date: homeController.state
                                    .patientAppointmentList[0].selectedDate
                                    .toString(),
                                // date: '',
                                time: homeController.state
                                    .patientAppointmentList[0].selectedTimeSlot
                                    .toString(),
                                id: '',
                                // model: null,
                              )),
                  ],
                ),
              ),
      ),
    );
  }
}
