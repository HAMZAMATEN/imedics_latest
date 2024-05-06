import 'package:get/get.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';

class AllAppointmentState {
  List<UserDocModel> upcomingDoc = [];


  List<String> imageUrlsToShare = [];

  RxBool uploadLoading = false.obs;
}