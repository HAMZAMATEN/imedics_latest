// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/components/session_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/profile/controller.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/wallet/summary.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';

class AddPaymentScreen extends StatelessWidget {
  AddPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorProfileController());
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color(0xff38B698).withOpacity(0.1),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        automaticallyImplyLeading: true,
        title: Text(
          'Add Payments Method',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      // appBar: CommonAppBar(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   appBarTitle: 'Add Payments Method',
      // ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),

          // image: DecorationImage(
          //   image: AssetImage(AppAssets.homeBg),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                padding10,
                CustomTextField(
                  controller: controller.state.bank,
                  hintText: '',
                  onChanged: (string) {},
                  onFieldSubmitted: (string) {},
                  obscure: false,
                  label: 'Bank',
                  subTitle: '',
                ),
                padding10,
                CustomTextField(
                  controller: controller.state.accountTitle,
                  hintText: '',
                  onChanged: (string) {},
                  onFieldSubmitted: (string) {},
                  obscure: false,
                  label: 'Account Title',
                  subTitle: '',
                ),
                padding10,
                CustomTextField(
                  controller: controller.state.accountNumber,
                  hintText: '',
                  onChanged: (string) {},
                  onFieldSubmitted: (string) {},
                  obscure: false,
                  label: 'Account/IBAN Number',
                  subTitle: '',
                ),
                padding10,
                CustomTextField(
                  controller: controller.state.branchCode,
                  hintText: '',
                  onChanged: (string) {},
                  onFieldSubmitted: (string) {},
                  obscure: false,
                  label: 'Branch Code',
                  subTitle: '',
                ),
                padding16,
                SessionButton(
                    back: () {},
                    onPressed: () {
                      Get.to(
                        () => WalletSummaryPage(),
                      );
                      // Navigator.pushNamed(
                      //     context, AppRoutes.walletSummaryPage);
                      // controller.backDetails();
                    },
                    isbackbuton: false,
                    text: 'Next')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
