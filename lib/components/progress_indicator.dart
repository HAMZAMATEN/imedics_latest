import 'package:flutter/material.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ShowProgressIndicator extends StatelessWidget {
  const ShowProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: AppColors.appColor,
      size: 50,
    );
  }
}
