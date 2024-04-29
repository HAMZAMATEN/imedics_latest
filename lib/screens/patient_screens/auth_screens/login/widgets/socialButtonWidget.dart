
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class USocialButtonCard extends StatelessWidget {
  final String image;
  final String text;
  final Function() onTap;
  // final isloading;
  const USocialButtonCard(
      {super.key,
        // this.isloading,
        required this.image,
        required this.text,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: 54.h,
        width: 160.w,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(color: AppColors.lightgrey, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.02),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 18.17.h,
              width: 18.17.w,
            ),
            padding10,
            // isloading == false
            Text(
              text,
              style: getLightStyle(
                color: AppColors.loginScreenTextColor,
                fontSize: MyFonts.size16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
