

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:http/http.dart' as http;

class PaymentController {

  dynamic paymentIntent;

  displayPaymentSheet(BuildContext context,String id) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        Navigator.pop(context);
        print(":::::::::::DisplaypaymentResponse:::::::::::");
        print(value);

        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 100.0,
                  ),
                  SizedBox(height: 10.0),
                  Text("Payment Successful!"),
                  SizedBox(height: 10.0),
                ],
              ),
            ));

        // create booking
        // createBooking(context,id);

        paymentIntent = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String currency, double totalAmount) async {
    AppConstants.stripe_secret_key = dotenv.env['STRIPE_SECRET_KEY']!;

    try {
      //Request body
      Map<String, dynamic> body = {
        // 'amount': calculateAmount(amount),
        'amount': calculateDoubleAmount(totalAmount),
        'currency': currency,
        'receipt_email': AppConstants.userEmail,
        'description': 'Doctors checkup fee',
        // The description of Payment
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${AppConstants.stripe_secret_key}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      print(":::::::::::Create Payment Intent :::::::::::::");
      final data = json.decode(response.body);
      print('data:$data');
      AppConstants.paymentId = data['id'].toString();
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> makePayment(BuildContext context, double totalAmount,String id) async {
    try {
      //STEP 1: Create Payment Intent
      paymentIntent = await createPaymentIntent('USD', totalAmount);
      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              //Gotten from payment intent
              style: ThemeMode.light,
              merchantDisplayName: 'IMedFix'))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet(context,id);
    } catch (err) {
      throw Exception(err);
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }

  String calculateDoubleAmount(double amount) {
    int result = (amount * 100).round();
    return result.toString(); // Output: 16375
  }

}