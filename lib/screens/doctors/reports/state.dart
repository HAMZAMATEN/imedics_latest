import 'package:get/get.dart';
import 'package:imedics_latest/models/doctors/patient_model.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/patient_appoint_model.dart';
import 'package:imedics_latest/utils/app_assets.dart';

class DoctorReportState {
  final List<String> text = ['Blood Report', 'CT Scan', 'MRI'];
  final List<String> textFields = ['BloodReport', 'STscan', 'MRI'];
  final List<String> reportType = ['Blood-Report', 'CT-Scan', 'MRI'];
  final List<String> image = [
    AppAssets.bloodRep,
    AppAssets.ctscan,
    AppAssets.mri
  ];
  int? expandedIndex;

  var downloadImgLoading = false.obs;


  var appointmentFetchLoading = false.obs;
  var completedAppointmentList = [];
  List<PatientAppointmentModel> patientAppointmentList = [];
  var docListFetchLoading = false.obs;
  var doctorsList = [];
  late PatientModel patientModel;

}