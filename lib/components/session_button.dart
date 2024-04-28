import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_text_widgets.dart';
import 'package:imedics_latest/helpers/myFonts.dart';

class SessionButton extends StatelessWidget {
  SessionButton(
      {super.key,
        this.onPressed,
        required this.isbackbuton,
        required this.back,
        required this.text});
  final VoidCallback? onPressed;
  final bool isbackbuton;
  final String text;
  final VoidCallback back;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isbackbuton)
          InkWell(
            onTap: back,
            child: Container(
              width: 50,
              height: 45,
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                ),
              ),
              decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        Expanded(
          child: CustomButton(
            onPressed: onPressed,
            buttonText: text,
            textStyle:
            getBoldStyle(color: AppColors.white, fontSize: MyFonts.size20),
          ),
        )
      ],
    );
  }
}
