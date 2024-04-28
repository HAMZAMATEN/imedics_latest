import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController(initialPage: 0);

  RxInt state = 0.obs;

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(microseconds: 300), curve: Curves.easeIn);
    state++;
  }

  bool isLastPage(int totalScreens) {
    return state >= totalScreens - 1;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
