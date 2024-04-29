
import 'package:flutter/material.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/auth_screens/login/widgets/socialButtonWidget.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class USignupJustJoinSection extends StatelessWidget {
  const USignupJustJoinSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            justjoin,
            style:
            getMediumStyle(color: AppColors.black, fontSize: MyFonts.size24),
          ),
          padding16,
          Text(
            createAcountToGetStart,
            style: getRegularStyle(
                color: AppColors.loginScreenTextColor, fontSize: MyFonts.size14),
          ),
          padding80,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              USocialButtonCard(
                onTap: () {
                  // Handle tap event on google button
                },
                image: AppAssets.google,
                text: google,
              ),
              USocialButtonCard(
                onTap: () {},
                image: AppAssets.facebook,
                text: facebook,
              )
            ],
          ),
        ],
      ),
    );
  }
}
