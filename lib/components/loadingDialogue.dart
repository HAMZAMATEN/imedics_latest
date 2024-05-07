import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/helpers/app_colors.dart';

Future<void> showAppLoading(BuildContext context) async{
  showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title:  Text('Please wait ...',style: getBoldStyle(color: AppColors.appColor,fontSize: 14),),
      content: ShowProgressIndicator(),
    ),
  );
}
