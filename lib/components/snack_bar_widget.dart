import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';

// import '../helper/app_colors.dart';

class Snackbar {
  static void showSnackBar(String msg, IconData iconData) {
    String message = extractErrorMessage(msg);
    Get.snackbar(
      "IMedFix",
      message,
      backgroundColor: Colors.white,
      colorText: Colors.green,
      titleText: Text(
        "IMedFix",
        style: getBoldStyle(color: Colors.green,
        fontSize: 17,
        ),
        // style: GoogleFonts.poppins(
        //     fontSize: 17, fontWeight: FontWeight.bold, color: Colors.green
        //   // for a splash of color
        // ),
      ),
      messageText: Text(
        message,
        style: getRegularStyle(color: Colors.green,
          fontSize: 15,
        ),
        // style: GoogleFonts.openSans(
        //     fontSize: 15, color: Colors.green),
      ),
      icon: Icon(
        iconData,
        color: Colors.green,
        size: 25,
      ),
      snackPosition: SnackPosition.TOP,
      borderRadius: 8,
      margin: EdgeInsets.all(10),
      forwardAnimationCurve: Curves.bounceInOut,
      reverseAnimationCurve: Curves.easeOut,
    );
  }

  static String extractErrorMessage(String error) {
    if (error.contains(']')) {
      return error.split(']').last.trim();
    }
    return error; // return the original error if no "]" is found
  }
}
