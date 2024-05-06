import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';

Future<void> showAppCustomDialogue(BuildContext context,String title,String descr,String buttonText,Icon icon,VoidCallback retryFunction) async{
  showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title:  Text('${title}',style: getBoldStyle(color: AppColors.appColor,fontSize: 14),),
      content: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          icon,
          SizedBox(
            height: 15,
          ),
          Text('${descr}',style: getSemiBoldStyle(color: Colors.black,fontSize: 12)),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: retryFunction,
          child:  Text('${buttonText}',style: getSemiBoldStyle(color: Colors.black,fontSize: 11)),
        ),
      ],
    ),
  );
}
