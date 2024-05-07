import 'package:get/get.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';

class AllAppointmentState {
  List<UserDocModel> upcomingDoc = [];


  List<String> imageUrlsToShare = [];
  List<String> reportTypeList = [];

  List<ReportModel> reportList = [];

  RxBool uploadLoading = false.obs;


}

class ReportModel {
    String imageUrl;
    String reportType;

    ReportModel({required this.imageUrl,required this.reportType});
}