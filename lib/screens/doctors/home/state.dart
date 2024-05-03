import 'package:get/get.dart';
import 'package:imedics_latest/models/doctors/patient_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';

class DoctorHomeState {
  var appointmentFetchLoading = false.obs;
  var completedAppointmentList = [];
  var patientAppointmentList = [];
  var docListFetchLoading = false.obs;
  var doctorsList = [];
  late PatientModel patientModel;
}