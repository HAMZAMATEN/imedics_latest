import 'package:get/get.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/helpers/shared_prefrences.dart';
import 'package:imedics_latest/screens/common/onboarding/view.dart';

class SplashController extends GetxController {
  init() async {
    Future.delayed(Duration(seconds: 3), () async {
      String? userId = await SharedPrefrences().getUserId();
      String? userindex = await SharedPrefrences().getUserindex();
      if (userId == null || userId.isEmpty) {
        Get.offAll(
          () => OnbordingScreen(),
        );
      } else {
        if (userindex == '1') {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DoctorMainMenuScreenMain(),
          //   ),
          // );
          print(" indexsss1 ====>>>> ${userindex.toString()}");
        } else {
          // Navigator.pushReplacementNamed(context, AppRoutes.userMainMenuScreen);
          print(" indexsss2 ${AppConstants.accountType.toString()}");
        }
      }
    });
  }
}
