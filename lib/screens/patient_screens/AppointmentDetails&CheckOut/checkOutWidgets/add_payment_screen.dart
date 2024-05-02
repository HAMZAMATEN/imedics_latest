

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/checkOutWidgets/payment_summary.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/controller.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';

class AddPaymentScreen extends StatelessWidget {
  SetAppointmentDetailsController appController;
  UserDocModel doctor;
  AddPaymentScreen({super.key,required this.appController,
  required this.doctor
  });

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController accountTitleController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(UserHomeScreenProvider());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff38B698).withOpacity(0.1),
          automaticallyImplyLeading: true,
          title: Text(
            'Add Payments Method',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: 1.sh,
          width: 1.sw,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.homeBg),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          AppColors.appColor1,
                          AppColors.appColor,
                        ])),
                    // color: const Color(0xff5EEF8F),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Allied Bank',
                                style: getBoldStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                          padding15,
                          Text(
                            '4242 4242 4242 4242',
                            style:
                            getBoldStyle(color: Colors.white, fontSize: 20),
                          ),
                          padding15,
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Card Holder Name',
                                    style: getBoldStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  Text(
                                    AppConstants.userName,
                                    style: getBoldStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Expiry Date',
                                    style: getBoldStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  Text(
                                    '03/26',
                                    style: getBoldStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  padding20,
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Card Holder Name*"),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white,
                          ),
                          child: TextField(
                            controller: appController.state.accTitleCont,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              labelText: 'John Doe',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.3),
                                    width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 1.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  padding20,
                  // padding10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Card Number*"),
                      TextField(
                        controller: appController.state.cardNumCont,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          labelText: '5366 1900 4433 1632',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                                width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                                color: Colors.grey, width: 1.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  padding10,
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Expiry Year*"),
                              Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  controller: appController.state.yearCont,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    labelText: '27',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.3),
                                          width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Expiry Month*"),
                              Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  controller: appController.state.monthCont,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    hintText: '10',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.3),
                                          width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: appController.state.cvvCont,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center, // Center align the text
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'CVV*',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  padding16,
                  CustomButton(
                      onPressed: () {
                        if(appController.state.accTitleCont.text.isEmpty ||
                            appController.state.cardNumCont.text.isEmpty ||
                            appController.state.yearCont.text.isEmpty ||
                            appController.state.monthCont.text.isEmpty ||
                            appController.state.cvvCont.text.isEmpty
                        )
                        {
                          Snackbar.showSnackBar("Fill Necessary Fields", Icons.error_outline);
                        }else{
                          Get.to(()=>PaymetSummaryView(appController: appController, doctor: doctor,));
                        }
                      },
                      buttonText: 'Next')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
