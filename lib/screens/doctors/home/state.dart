import 'package:get/get.dart';
import 'package:imedics_latest/models/doctors/patient_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';

class DoctorHomeState {
  var appointmentFetchLoading = false.obs;
  var downloadImgLoading = false.obs;
  var completedAppointmentList = [];
  List<PatientAppointmentModel> patientAppointmentList = [];
  var docListFetchLoading = false.obs;
  var doctorsList = [];

  late PatientModel patientModel;
}