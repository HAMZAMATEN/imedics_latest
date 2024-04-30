
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class doctorListCard extends StatelessWidget {
  final String id;
  final String image;
  final String name;
  final String speciality;
  final double rating;
  final String review;
  const doctorListCard(
      {super.key,
        required this.id,
        required this.image,
        required this.name,
        required this.speciality,
        required this.rating,
        required this.review});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6.r),
      highlightColor: AppColors.transparentColor,
      splashColor: AppColors.transparentColor,
      onTap: (){

      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.5),
          width: 0.4
          )
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            CachedNetworkImage(
              imageUrl: image!=""?"${AppConstants.imageBaseUrl+image}":'assets/images/whiteman.png',
              height: 92.h,
              width: 82.w,
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
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name,
                          style: getBoldStyle(
                              color: AppColors.black, fontSize: MyFonts.size18)),
                      SizedBox(width: 6.w),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border_outlined,
                            color: AppColors.appColor,
                          )),
                    ],
                  ),
                  Container(
                    height: 2.h,
                    width: double.infinity,
                    color: AppColors.lightgrey,
                  ),
                  Text(
                    speciality,
                    style: getRegularStyle(color: Colors.black,fontSize: MyFonts.size13),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.ratingColor,
                        size: 13.h,
                      ),
                      SizedBox(width: 2.w),
                      Text(rating.toString(),
                          style: getMediumStyle(
                              color: AppColors.black, fontSize: MyFonts.size12)),
                      SizedBox(width: 5.w),
                      Text(review,
                          style: getMediumStyle(
                              color: AppColors.grey, fontSize: MyFonts.size12)),
                    ],
                  ),
                  padding16
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
