

import 'package:flutter/material.dart';
import 'package:imedics_latest/helpers/app_colors.dart';

class ProfilePicWidget extends StatelessWidget {
  const ProfilePicWidget(
      {super.key, required this.onPressed, required this.picturepath});
  final VoidCallback onPressed;
  final String picturepath;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -70,
      right: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  color: AppColors.grey.withOpacity(0.20),
                  child: Image.asset(
                    picturepath,
                    height: 130,
                    width: 130,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
