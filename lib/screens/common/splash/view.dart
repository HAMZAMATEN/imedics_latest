
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/common/splash/controller.dart';
import 'package:imedics_latest/utils/app_assets.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  // void _navigateToNextScreen() async {
  @override
  Widget build(BuildContext context) {
    final splashController = Get.put(SplashController());
    splashController.init();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: AppColors.appColor,
            image: DecorationImage(
                image: AssetImage(AppAssets.bgImage), fit: BoxFit.cover)),
      ),
    );
  }
}
