import 'package:get/get.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';

class SpecializedDoctorsState {

  RxBool filterLoading = false.obs;
  List<UserDocModel> filteredDocsList = [];
}