import 'package:get/get.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/state.dart';
import 'package:imedics_latest/screens/patient_screens/home/controller.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';

class AllAppointmentController extends GetxController {
final state = AllAppointmentState();

UserDocModel getUpComingAppointDoc(UserHomeController controller,String docId){
    late UserDocModel appDoc;
    for(UserDocModel doc in controller.state.doctorsList){
      if(doc.sId == docId){
        appDoc = doc;
      }
    }
      return appDoc;
  }

}