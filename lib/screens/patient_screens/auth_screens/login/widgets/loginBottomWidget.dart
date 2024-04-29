

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/auth_screens/login/widgets/socialButtonWidget.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class ULoginBottomSection extends StatelessWidget {
  const ULoginBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        padding16,
        Row(
          children: [
            Expanded(
                child: Container(
                  height: 1.5.h,
                  color: AppColors.lightgrey,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Or Continue With',
                style: getMediumStyle(
                    color: AppColors.grey, fontSize: MyFonts.size14),
              ),
            ),
            Expanded(
                child: Container(
                  height: 1.5.h,
                  color: AppColors.lightgrey,
                )),
          ],
        ),
        padding20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            USocialButtonCard(
              onTap: () {
                //method to handle facebook signIn
              },
              image: AppAssets.facebook,
              text: "Facebook",
            ),
            USocialButtonCard(

              onTap: () {
                //method to handle google signIn

              },
              image: AppAssets.google,
              text: "Google",
            ),
          ],
        ),
      ],
    );
  }
}
