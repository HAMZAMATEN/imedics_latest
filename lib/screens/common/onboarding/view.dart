import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/common/accountType/view.dart';
import 'package:imedics_latest/screens/common/onboarding/controller.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

import 'widgets/onboarding_page.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          OnboardingPageSection(
            title: onBoardingScreens1,
            image: AppAssets.splash_31,
            subtitle: subonBoardingScreens1,
          ),
          OnboardingPageSection(
            title: onBoardingScreens2,
            image: AppAssets.splash_1,
            subtitle: subonBoardingScreens1,
          ),
          OnboardingPageSection(
            title: onBoardingScreens3,
            image: AppAssets.splash_31,
            subtitle: subonBoardingScreens1,
          ),
          // Add more screens here
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 37, bottom: 32),
        child: CustomButton(
          onPressed: () {
            controller.state.value == 2
                ? Get.offAll(() => AccountTypeScreen())
                : controller.nextPage();
          },
          buttonText: 'Next',
          textStyle:
              getBoldStyle(color: AppColors.white, fontSize: MyFonts.size18),
        ),
      ),
    );
  }
}
