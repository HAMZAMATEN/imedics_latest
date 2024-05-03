import 'package:get/get.dart';
import 'package:imedics_latest/screens/patient_screens/All_Specialization/state.dart';
import 'package:imedics_latest/screens/patient_screens/home/controller.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';

class SpecializedDoctorsController extends GetxController {
  final state = SpecializedDoctorsState();


  void setFilterLoading(bool val){
    state.filterLoading.value = val;
  }
  void filterDoctors(UserHomeController controller, String specialization){
    state.filteredDocsList = [];
    setFilterLoading(true);
    for(UserDocModel doc in controller.state.doctorsList){
      if(doc.specialization!.contains(specialization)){
        state.filteredDocsList.add(doc);
      }
    }
    setFilterLoading(false);
  }


}