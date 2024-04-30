import 'package:get/get.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';

class UserHomeState {
  List<PatientAppointmentModel> patientAppointmentList =[];
  RxBool appointmentFetchLoading = false.obs;
}