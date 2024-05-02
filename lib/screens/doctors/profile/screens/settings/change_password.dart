import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/components/session_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/profile/controller.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      DoctorProfileController(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          'Change Password',
          style: getSemiBoldStyle(
              color: AppColors.black94, fontSize: MyFonts.size18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              padding10,
              CustomTextField(
                controller: controller.state.currentPasCon,
                hintText: 'Current Password',
                onChanged: (string) {},
                onFieldSubmitted: (string) {},
                leadingIconPath: 'assets/icons/key.png',
                obscure: false,
                label: '',
                subTitle: '',
              ),
              padding10,
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  forgorpassword,
                  style:
                      getSemiBoldStyle(color: AppColors.appColor, fontSize: 16),
                ),
              ),
              padding10,
              CustomTextField(
                controller: controller.state.newPassCon,
                hintText: 'New Password',
                onChanged: (string) {},
                onFieldSubmitted: (string) {},
                leadingIconPath: 'assets/icons/key.png',
                obscure: false,
                label: '',
                subTitle: '',
              ),
              padding10,
              CustomTextField(
                controller: controller.state.confirmPasCon,
                hintText: 'Confirm Password',
                onChanged: (string) {},
                onFieldSubmitted: (string) {},
                leadingIconPath: 'assets/icons/key.png',
                obscure: false,
                label: '',
                subTitle: '',
              ),
              padding16,
              SessionButton(
                  back: () {},
                  onPressed: () {
                    // Navigator.pushNamed(
                    //     context, AppRoutes.walletSummaryPage);
                    // controller.backDetails();
                  },
                  isbackbuton: false,
                  text: 'Change Password')
            ],
          ),
        ),
      ),
    );
  }
}
