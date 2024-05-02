import 'package:get/get.dart';
import 'package:imedics_latest/screens/doctors/session/register/state.dart';

class IndividualDoctorRegisterController extends GetxController {
  final state = IndividualDoctorRegistrationState();

  changescreen(int index) {

      state.selectdpage.value = index;

  }

}