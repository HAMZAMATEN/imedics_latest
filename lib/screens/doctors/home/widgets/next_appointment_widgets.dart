import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/home/next_appointment/next_appointment_screen.dart';
import 'package:imedics_latest/screens/doctors/home/widgets/view.dart';
import 'package:imedics_latest/utils/myFonts.dart';
import 'package:intl/intl.dart';

class DNextAppointmentWidget extends StatefulWidget {
  @override
  State<DNextAppointmentWidget> createState() => _DNextAppointmentWidgetState();
}

class _DNextAppointmentWidgetState extends State<DNextAppointmentWidget> {
  // final DoctorIndHomeProvider controller =
  // Get.put(DoctorIndHomeProvider(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Next Appointments',
            style: getBoldStyle(
              color: AppColors.textColor,
              fontSize: MyFonts.size16,
            ),
          ),
          SizedBox(
              child: UDoctorNextAppointmentCard(
            onTap: () {
              Get.to(
                () => UserNextAppointmenyScreen(
                  PatientNames: 'PatientNames',
                  id: 'id',
                  specialist: 'specialist',
                  sletedDate: 'sletedDate',
                  seltedTime: 'seltedTime',
                  DoctorName: 'DoctorName',
                ),
              );
              // ConformOppointmentModel model = ConformOppointmentModel(id: '0');
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => UserNextAppointmenyScreen(
              //               specialist: 'Dentist',
              //               DoctorName: 'Ikram Khan',
              //               id: 'id',
              //               PatientNames: 'name',
              //               sletedDate: 'formattedDate',
              //               model: model,
              //               seltedTime: "thursday",
              //             )));
            },
            name: 'Dr.  John ',
            // name: 'Dr. ${details.name.toString() == '' ? 'John' : details.name.toString()}',
            // specialist: details.specialization.toString() == '' ? 'hu' : details.specialization.toString(),
            specialist: 'hu',
            image: 'assets/images/whiteman.png',
            // rating: 5,
            date: 'No appointment Found',
            time: DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
            id: '',
            // model: null,
          )

              // Obx(
              //       () {
              //     final details =
              //     doctorcontroller.SpecificDoctorDetailsList.first!;
              //     final appointments = controller.Doctorbookappointmentlist.value;
              //     return appointments.isEmpty
              //         ? UDoctorNextAppointmentCard(
              //       onTap: () {
              //         ConformOppointmentModel model =
              //         ConformOppointmentModel(id: '0');
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) =>
              //                     UserNextAppointmenyScreen(
              //                       specialist: 'Dentist',
              //                       DoctorName: 'Ikram Khan',
              //                       id: 'id',
              //                       PatientNames: 'name',
              //                       sletedDate: 'formattedDate',
              //                       model: model,
              //                       seltedTime: "thursday",
              //                     )));
              //       },
              //       name: 'Dr. ${details.name.toString()}',
              //       specialist: details.specialization.toString(),
              //
              //       image: 'assets/images/whiteman.png',
              //       // rating: 5,
              //       date: 'No appointment Found',
              //       time: DateFormat('yyyy-MM-dd')
              //           .format(DateTime.now())
              //           .toString(),
              //       id: '',
              //       model: null,
              //     )
              //         :
              //
              //     ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       shrinkWrap: true,
              //       itemCount: appointments.length,
              //       padding: EdgeInsets.only(top: 10),
              //       itemBuilder: (context, index) {
              //
              //         final appointmentDetails =
              //             appointments[index].appointmentDetails;
              //         final patientDetails =
              //             appointments[index].patietnDetails;
              //
              //         ConformOppointmentModel model =
              //         ConformOppointmentModel(
              //           id: appointmentDetails!.sId.toString(),
              //           bookingDate:
              //           appointmentDetails.bookingDate.toString(),
              //           fees: appointmentDetails.fees.toString(),
              //           bookingFor:
              //           appointmentDetails.bookingFor.toString(),
              //           docId: appointmentDetails.docId.toString(),
              //           gender: appointmentDetails.gender.toString(),
              //           patientAge:
              //           appointmentDetails.patientAge.toString(),
              //           selectedDate:
              //           appointmentDetails.selectedDate.toString(),
              //           selectedTimeSlot:
              //           appointmentDetails.selectedTimeSlot.toString(),
              //           userId: appointmentDetails.userId.toString(),
              //         );
              //
              //         return Padding(
              //           padding: EdgeInsets.only(bottom: 10),
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(horizontal: 10),
              //             child: UDoctorNextAppointmentCard(
              //               id: appointmentDetails.sId.toString(),
              //               model: model,
              //               date: appointmentDetails.selectedDate
              //                   ?.toString() ??
              //                   'N/A',
              //               time: appointmentDetails.selectedTimeSlot ??
              //                   'N/A',
              //               name: patientDetails?.username?.toString() ??
              //                   'Unknown Doctor',
              //               specialist: '',
              //               // Add appropriate value or logic
              //               image: 'assets/images/im1.png',
              //               onTap: () {},
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   },
              // ),
              ),
        ],
      ),
    );
  }
}
