
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/checkOutWidgets/payment_controller.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/checkOutWidgets/paypal_checkout.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/controller.dart';
import 'package:imedics_latest/screens/patient_screens/applicationScreens/view.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

import 'add_payment_screen.dart';

class UserSelectAccountTypeView extends StatefulWidget {
  SetAppointmentDetailsController appController;
  UserDocModel doctor;
  UserSelectAccountTypeView({Key? key,
    required this.appController,
  required this.doctor,
  }) : super(key: key);

  @override
  State<UserSelectAccountTypeView> createState() => _UserSelectAccountTypeViewState();
}

class _UserSelectAccountTypeViewState extends State<UserSelectAccountTypeView> {

  // Track selection state for each payment option
  bool isSelectedCard = false; // Set the default selection to Bank Card
  bool isSelectedPaypal = false;
  bool isSelectedApple = false;

  // final controller = Get.put(UserHomeScreenProvider());

  @override
  Widget build(BuildContext context) {
    int totalAmount = int.parse(widget.doctor.once[0]['consultationfees'])+5;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff38B698).withOpacity(0.1),
        title: Text(
          'Payment Account Type',
          style: getSemiBoldStyle(color: Colors.black,fontSize: MyFonts.size20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.add,
              size: 25,
              color: Colors.black,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.homeBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.030),
              Text('Credit & Debit Card',
                style: getSemiBoldStyle(color: Colors.black,fontSize: MyFonts.size18),
              ),
              SizedBox(
                height: 10,
              ),
              _buildPaymentOption(
                screenWidth,
                '... ... ... ... ... 5738',
                'assets/icons/icons/bank_card.png',
                isSelectedCard,
                    () {
                  if (!isSelectedCard) {
                    setState(() {
                      isSelectedCard = true;
                      isSelectedPaypal = false;
                      isSelectedApple = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddPaymentScreen(appController: widget.appController, doctor: widget.doctor,)))
                        .then((value) {
                      isSelectedCard = false;
                      isSelectedApple = false;
                      isSelectedPaypal = false;
                      setState(() {});
                    });
                  }
                },
              ),
              SizedBox(height: 40),
              Text('More Payment Options',
                style: getSemiBoldStyle(color: Colors.black,fontSize: MyFonts.size16),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: (){
                    PaymentController().makePayment(context, 200, "${AppConstants.userId}");
                  },
                  child: Text("Pay using stripe",style: getBoldStyle(color: AppColors.appColor,fontSize: 50),)),
              SizedBox(
                height: 10,
              ),
              _buildPaymentOption(
                screenWidth,
                'Paypal',
                'assets/icons/icons/paypal.png',
                isSelectedPaypal,
                    () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PaypalCheckout(
                      returnURL: "success.snippetcoder.com",
                      cancelURL: "cancel.snippetcoder.com",
                      sandboxMode: true,
                      clientId:
                      "AXFXfhTpTp775JjaH5UJwVPijLmayOeYeNuO-i8OHdtlzhQzavePzvvp0IVi0HnfrH6Egi_gn6buv9QV",
                      secretKey:
                      "ECUBk3NbfWOTfxF31w8gcv4FkDzA84NOiEc1FtPWjJm6Vdwe4WHnP06XJt7OjFzbN-B-1E7gQHWxtuXY",
                      transactions:  [
                        {
                          "amount": {
                            "total": '${totalAmount}',
                            "currency": "USD",
                            "details": {
                              "subtotal": '${totalAmount}',
                              "shipping": '0',
                              "shipping_discount": 0
                            }
                          },
                          "description": "The consultation fee of doctor for a regular checkup.",
                        }
                      ],
                      note: "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
                        widget.appController.bookAppointment(context,widget.doctor ,widget.appController);
                      },
                      onError: (error) {
                        print("onError: $error");
                        Navigator.of(context).pop();
                      },
                      onCancel: () {
                        print('cancelled:');
                      },
                    ),
                  ));
                  // Toggle the selection for Paypal
                  // setState(() {
                  //   isSelectedCard = false;
                  //   isSelectedPaypal = true;
                  //   isSelectedApple = false;
                  // });
                },
              ),
              SizedBox(height: 20),
              _buildPaymentOption(
                screenWidth,
                'Apple',
                'assets/icons/icons/apple.png',
                isSelectedApple,
                    () {
                  // Toggle the selection for Apple
                  setState(() {
                    isSelectedCard = false;
                    isSelectedPaypal = false;
                    isSelectedApple = true;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(double screenWidth, String label, String iconPath,
      bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          children: [
            SizedBox(width: 20),
            Image.asset(
              iconPath,
            ),
            SizedBox(width: 15),
            Text(
              label,
              style: getSemiBoldStyle(color: Colors.black,fontSize: MyFonts.size18),

            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 15),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Center(
                child: isSelected
                    ? Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff5EEF8F),
                        Color(0xff00A69D),
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                )
                    : SizedBox(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
