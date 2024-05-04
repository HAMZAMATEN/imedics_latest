import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';


class ReportViewState {
  Rx<String> dorpDownValue = "Select".obs;

  List<DropdownMenuItem> catogeryList = [
    DropdownMenuItem(child: Text("Blood Report",style: getRegularStyle(color: Colors.black54),),value: "Blood-Report",),
    DropdownMenuItem(child: Text("CT-Scan",style: getRegularStyle(color: Colors.black54),),value: "CT-Scan",),
    DropdownMenuItem(child: Text("MRI",style: getRegularStyle(color: Colors.black54),),value: "MRI",),
  ];

  Rx<String> reportUrl = "".obs;
  RxBool imageUploadLoading = false.obs;

}