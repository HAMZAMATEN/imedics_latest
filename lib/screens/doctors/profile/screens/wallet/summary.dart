// ignore_for_file: prefer_const_constructors


import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/session_button.dart';
import 'package:imedics_latest/screens/doctors/profile/controller.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/wallet/payment_successfull_screen.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';

class WalletSummaryPage extends StatelessWidget {
  WalletSummaryPage({super.key});

  static int amounts = 20;
  final controller = Get.put(DoctorProfileController());
  // static String doctorFee = UserHomeScreenProvider()
  //         .userSpecificDoctorDetailsList[0]
  //         .once?[0]
  //         .consultationfees
  //         .toString() ??
  //     '0';

  // var totalAmount = amounts + int.parse(doctorFee);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHight = MediaQuery.of(context).size.height;

    // print('doctor amount  ${doctorFee}');
    // print('total amount  ${amounts}');
    // print('total amount  ${totalAmount}');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff38B698).withOpacity(0.1),
        automaticallyImplyLeading: true,
        title: Text(
          'Payment Summary',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: screenHight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.homeBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.white,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  padding10,
                                  Text(
                                    'Summary',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  padding15,
                                  buildHeadTitleWidget(
                                    'Account Tittle',
                                    controller.state.accountTitle.text,
                                  ),
                                  padding10,
                                  buildHeadTitleWidget(
                                    'Account Number',
                                    controller.state.accountNumber.text,
                                  ),
                                  padding10,
                                  buildHeadTitleWidget(
                                    'Date',
                                    controller.state.slectedDays.toString(),
                                  ),
                                  padding10,
                                  buildHeadTitleWidget(
                                    'Transaction Id',
                                    '#37698',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          dottedLine(),
                          Expanded(
                            child: SizedBox(
                              child: Column(
                                children: [
                                  padding24,
                                  buildHeadTitleWidget(
                                    'Transfer Amount',
                                    // controller.userSpecificDoctorDetailsList[0]
                                    //     .once?[0].consultationfees ??
                                        '0',
                                  ),
                                  padding10,
                                  buildHeadTitleWidget(
                                    'Transfer fees',
                                    '${amounts}',
                                  ),
                                  // Expanded(child: Container()),
                                  // buildHeadTitleWidget(
                                  //   'Balance Amount',
                                  //   totalAmount.toString(),
                                  // ),
                                  padding20,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      left: -20,
                      top: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        backgroundColor: Color(0xffE9F9F6),
                      ),
                    ),
                    const Positioned(
                      right: -20,
                      top: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        backgroundColor: Color(0xffE9F9F6),
                      ),
                    ),
                  ],
                ),
              ),
              padding16,
              padding16,
              SessionButton(
                back: () {},
                onPressed: () async {
                  Get.to(() => PaymentSuccessful());
                  // controller.BookAppointmentMethod(context);
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PaymntSuccessfull(),
                  //   ),
                  // );
                },
                isbackbuton: false,
                text: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }

  dottedLine() {
    return const DottedLine(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      lineLength: double.infinity,
      lineThickness: 1.0,
      dashLength: 4.0,
      dashColor: Colors.black,
      dashRadius: 0.0,
      dashGapLength: 4.0,
      dashGapColor: Colors.transparent,
      dashGapRadius: 0.0,
    );
  }

  buildHeadTitleWidget(title, amounts) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          amounts,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
