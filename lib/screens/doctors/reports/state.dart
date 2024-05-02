import 'package:imedics_latest/utils/app_assets.dart';

class DoctorReportState {
  final List<String> text = ['Blood Report', 'CT Scan', 'MRI'];
  final List<String> textFields = ['BloodReport', 'STscan', 'MRI'];
  final List<String> image = [
    AppAssets.bloodRep,
    AppAssets.ctscan,
    AppAssets.mri
  ];
  int? expandedIndex;

}