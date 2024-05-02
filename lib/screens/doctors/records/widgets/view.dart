// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class UCommonRecordCard extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String status;
  final String rating;

  const UCommonRecordCard({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.status, required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: 126.h,
      // Use the isExpanded flag
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        // border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
      ),
      // The rest of your widget code remains the same
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Row(
                children: [
                  // Image container
                  Container(
                    height: 81.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      // border: Border.all(color: Colors.grey.withOpacity(0.5)),
                    ),
                    child: Center(
                      child: Image.asset(
                        image,
                        width: 45,
                        height: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  // Text section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: getBoldStyle(
                                  color: Colors.black, fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.star,
                                  height: 19,
                                  width: 19,
                                  color: Color.fromRGBO(231, 155, 18, 1),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  rating,
                                  style: getSemiBoldStyle(
                                      color: AppColors.black, fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.w,
                        ),
                        Text(
                          '${date}',
                          style: getSemiBoldStyle(
                            fontSize: 14.sp,
                            color: Color.fromRGBO(136, 136, 136, 1),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        RichText(
                          text: TextSpan(
                              style: getSemiBoldStyle(
                                color: Color.fromRGBO(136, 136, 136, 1),
                                fontSize: 14.sp,
                              ),
                              children: [
                                TextSpan(text: 'Status: '),
                                TextSpan(
                                  text: status,
                                  style: getSemiBoldStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.appColor),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Action buttons row
        ],
      ),
    );
  }
}
