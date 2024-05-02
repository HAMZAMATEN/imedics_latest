import 'package:get/get.dart';
import 'package:imedics_latest/screens/doctors/profile/state.dart';

class DoctorProfileController extends GetxController {
  final state = DoctorProfileState();

  setSelectedDay(String val) {
    state.slectedDays = val;
    update();
  }
}