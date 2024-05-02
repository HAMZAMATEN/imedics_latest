import 'package:get/get.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';

class UserHomeState {
  //appointment variables
  List<PatientAppointmentModel> patientAppointmentList =[];
  RxBool appointmentFetchLoading = false.obs;

  //doctors variables
  List<UserDocModel> doctorsList = [];
  RxBool docListFetchLoading = false.obs;
  late UserDocModel appointMentDoc ;
}