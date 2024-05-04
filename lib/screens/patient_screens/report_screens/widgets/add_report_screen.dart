import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/components/progress_indicator.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/report_screens/controller.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class AddReportView extends StatelessWidget {
  ReportViewController controller;
   AddReportView({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: const Color(0xff38B698).withOpacity(0.1),
        centerTitle: true,
        title: Text("Add Report",style: getSemiBoldStyle(color: Colors.black,fontSize: 20),),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Catogery',style: getSemiBoldStyle(color: Colors.black),),
              Obx(() => Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 7.h,horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${controller.state.dorpDownValue.value}",style: getSemiBoldStyle(color: Colors.black,fontSize: MyFonts.size18),),
                      DropdownButton(
                        // value: "Select",
                        iconSize: 40.w,
                          iconEnabledColor: AppColors.appColor,
                          iconDisabledColor: AppColors.appColor,
                          underline: Container(),
                          items: controller.state.catogeryList, onChanged: (value){
                        controller.state.dorpDownValue.value = value!;
                      }),
                    ],
                  ),
                ),
              )),
              padding15,
              // Text('Report Title',style: getSemiBoldStyle(color: Colors.black),),
              //
              // TextFormField(
              //   // controller: widget.controller.state.signUpEmailCont,
              //   decoration: InputDecoration(
              //       fillColor: Colors.white,
              //       filled: true,
              //       hintText: "Report Title",
              //       hintStyle: getSemiBoldStyle(color: Colors.black),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       )
              //   ),
              // ),
              // padding16,
              // UUploadCard(
              //   title: controller.filePath != null
              //       ? controller.filePath
              //       : "Upload File",
              //   onTap: _pickDocument,
              // ),
              padding16,
              Align(
                alignment: Alignment.topCenter,
                child: GetBuilder<ReportViewController>(
                  builder: (controller) {
                    return Stack(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(100),
                            border: Border.all(
                                width: 2,
                                color: AppColors.appColor),
                          ),
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(100),
                            child: controller.image == null
                                ? Icon(Icons.image)
                                : Image.file(
                              File(controller.image!.path)
                                  .absolute,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 0,
                          child: InkWell(
                            onTap: () {
                              controller.showImage(context);
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: AppColors.appColor,
                                borderRadius:
                                BorderRadius.circular(100),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.black54,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(100),
                                child: Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              padding35,
              Obx((){
                return controller.state.imageUploadLoading.value==false?InkWell(
                  onTap: () {
                    if(controller.state.dorpDownValue.value=="Select"){
                      Snackbar.showSnackBar("Select Report Catogery", Icons.error_outline);
                    }else{
                      if(controller.image==null){
                        Snackbar.showSnackBar("Select Report Image", Icons.error_outline);
                      }else{
                        controller.uploadImage(context);
                      }

                    }

                  },
                  child: Container(
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(color: AppColors.appColor, width: 1),
                    ),
                    child: Center(
                      child: Text(
                        'Upload',
                        style: getBoldStyle(
                          color: AppColors.appColor,
                          fontSize: MyFonts.size16,
                        ),
                      ),
                    ),
                  ),
                ):Align(
                  alignment: Alignment.topCenter,
                  child: Container(height: 50.h,width: 100.w,
                  child: ShowProgressIndicator(),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

