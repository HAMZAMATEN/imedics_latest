import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/All_appointments/controller.dart';
import 'package:imedics_latest/utils/app_assets.dart';

Widget reportExpansionTile(BuildContext context, String reportType,
    String imageUrl, AllAppointmentController controller) {
  RxBool switchVal = false.obs;
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: ExpansionTile(
      title: Row(
        children: [
          Container(
            height: 80.h,
            width: 81.w,
            // width: MediaQuery.of(context).size.width,
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(
                color: Color.fromRGBO(136, 144, 152, 0.85),
                width: 1.2,
              ),
              color: Color.fromRGBO(136, 144, 152, 0.1),
            ),
            child: Center(
              child: Container(
                height: 43.h,
                width: 43.w,
                child: Image.asset(
                  AppAssets.bloodRep,
                  color: AppColors.appColor,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${reportType}',
                    style: getBoldStyle(
                      color: AppColors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(width:20.w),
                  Obx(() => Align(
                    alignment: Alignment.topRight,
                    child: Switch(
                      activeColor: Colors.white,
                      activeTrackColor: AppColors.appColor,
                      value: switchVal.value,
                      onChanged: (val) {

                        if(val==true){
                          controller.addImageToList(imageUrl);
                        }
                        if(val ==false){
                          controller.removeImageFromList(imageUrl);
                        }
                        switchVal.value=val;

                      },
                    ),
                  ),),
                ],
              ),
              SizedBox(
                height: 4.w,
              ),
              Text(
                'Click to preview Document',
                style: getBoldStyle(
                  color: Color.fromRGBO(136, 136, 136, 1),
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ],
      ),
      children: [
        Container(
            child: CachedNetworkImage(
          imageUrl: "${imageUrl}",
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          fit: BoxFit.contain,
          placeholder: (context, url) => Container(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              color: AppColors.appColor,
            ),
          ),
          errorWidget: (context, url, error) => Image.asset(
            'assets/images/defaultDoc.jpg', // Path to your default image
            height: 92.h,
            width: 82.w,
            fit: BoxFit.contain,
          ),
        ))
      ],
    ),
  );
}
