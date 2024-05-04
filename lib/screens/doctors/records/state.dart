import 'package:get/get_rx/get_rx.dart';
import 'package:imedics_latest/models/doctors/patient_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';

class DoctorRecordState {

  var appointmentFetchLoading = false.obs;
  var completedAppointmentList = [];
  List<PatientAppointmentModel> patientAppointmentList = [];
  var docListFetchLoading = false.obs;
  var doctorsList = [];
  late PatientModel patientModel;
}