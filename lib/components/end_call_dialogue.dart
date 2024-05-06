import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';

Future<void> showEndCallDialogue(BuildContext context,VoidCallback retryFunction) async{
  showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title:  Text('End Session',style: getBoldStyle(color: AppColors.appColor,fontSize: 14),),
      content: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Icon(Icons.call,color: Colors.red,size: 56,),
          SizedBox(
            height: 15,
          ),
          Text('Are you sure you want to end call?\nCan\'t rejoing again',style: getSemiBoldStyle(color: Colors.black,fontSize: 12)),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: retryFunction,
          child:  Text('End Call!',style: getSemiBoldStyle(color: Colors.black,fontSize: 11)),
        ),
      ],
    ),
  );
}
