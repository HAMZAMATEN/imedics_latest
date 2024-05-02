
import 'dart:math';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/checkOutWidgets/payment_successfull.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/controller.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';

class PaymetSummaryView extends StatelessWidget {
  SetAppointmentDetailsController appController;
  UserDocModel doctor;
  PaymetSummaryView({super.key,required this.appController,required this.doctor});

  static int amounts = 5;
  // final controller = Get.put(UserHomeScreenProvider());
  int generateRandomNumber() {
    Random random = Random();
    return random.nextInt(900000) + 100000; // Generates a random number between 100000 and 999999
  }

  @override
  Widget build(BuildContext context) {
    int platformCharges = 5;
    int total_amount = platformCharges + int.parse(AppConstants.docFee);
    int reciptId = generateRandomNumber();
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
            fontSize: 20,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
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
                                    'Scheduled Appointment',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  padding15,
                                  // buildHeadTitleWidget(
                                  //   'Account Tittle',
                                  //   appController.state.accTitleCont.text.toString(),
                                  // ),
                                  // padding10,
                                  // buildHeadTitleWidget(
                                  //   'Account Number',
                                  //   appController.state.cardNumCont.text.toString(),
                                  // ),
                                  padding10,
                                  buildHeadTitleWidget(
                                    'Date',
                                    "${appController.state.year.value}-${appController.state.month.value}-${appController.state.date.value}",
                                  ),
                                  padding10,
                                  buildHeadTitleWidget(
                                    'Time',
                                    "${appController.state.time.value}",
                                  ),
                                  padding10,
                                  buildHeadTitleWidget(
                                    'Duration',
                                    "30 minutes",
                                  ),
                                  padding10,
                                  buildHeadTitleWidget(
                                    'Booking for',
                                    '${appController.state.bookingFor.value}',
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
                                    'Consultation Fee',
                                    "\$${AppConstants.docFee}",
                                  ),
                                  padding10,
                                  buildHeadTitleWidget(
                                    'Platform Charges',
                                    '\$${platformCharges}',
                                  ),
                                  // Expanded(child: Container()),
                                  // buildHeadTitleWidget(
                                  //   'Balance Amount',
                                  //   totalAmount.toString(),
                                  // ),
                                  padding20,
                                  padding20,
                                  buildHeadTitleWidget(
                                    'Sub Total',
                                    '\$${total_amount}',
                                  ),
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
              padding10,
              padding20,
              Container(
                // height: MediaQuery.of(context).size.height / 2,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:  EdgeInsets.all(20.w),
                  child: Column(
                    children: [
                      buildHeadTotalAmountWidget(
                        'Total Amount',
                        "\$${total_amount}",
                      ),
                    ],
                  ),
                ),
              ),
              padding16,
              padding16,
              CustomButton(

                onPressed: () async {
                  appController.bookAppointment(context,doctor,appController);
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PaymntSuccessfull(),
                  //   ),
                  // );

                },

                buttonText: 'Next',
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
        Spacer(),
        Text(
          amounts,
          style: TextStyle(
            color: Colors.grey,
            overflow: TextOverflow.ellipsis,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
  buildHeadTotalAmountWidget(title, amounts) {
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
        Spacer(),
        Text(
          amounts,
          style: TextStyle(
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
