import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';
import 'package:intl/intl.dart';

class UTopSearchWidget extends StatelessWidget {
  const UTopSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to Imedifix',
            style: getBoldStyle(
                color: AppColors.textColor, fontSize: MyFonts.size22),
          ),
          padding8,
          CustomTextField(
            validatorFn: (value) {
              // if (value!.isEmpty) {
              //   return 'Please enter your email';
              // }
              // return null;
            },
            leadingIconPath: AppAssets.search,
            trailingIconPath: AppAssets.filter,
            texfieldHeight: 60.h,
            controller: TextEditingController(),
            hintText: 'Search Pateint By Name',
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: '',
            subTitle: '',
          ),
        ],
      ),
    );
  }
}

//***************************************************************

class UDoctorNextAppointmentCard extends StatelessWidget {
  final String image;
  final String name;
  final String date;
  final String id;
  final String specialist;
  final VoidCallback onTap;
  final String time;

  // ConformOppointmentModel? model;

  UDoctorNextAppointmentCard(
      {super.key,
      required this.image,
      required this.id,
      required this.name,
      // required this.model,
      required this.specialist,
      required this.date,
      required this.onTap,
      required this.time});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          //  color: Colors.amber,
          height: 190.h,
          width: screensize.width.w,
          // width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    width: screensize.width.w,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5.r),
                      image: const DecorationImage(
                          image: AssetImage(AppAssets.bgGradient),
                          fit: BoxFit.cover),
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.appColor1,
                            AppColors.appColor,
                          ]),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth: 400.w, maxHeight: 48.h),
                                child: Text(name,
                                    style: getBoldStyle(
                                        color: AppColors.white,
                                        fontSize: MyFonts.size18)),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth: 402.w, maxHeight: 48.h),
                                child: Text(specialist,
                                    style: getSemiBoldStyle(
                                        color: AppColors.white,
                                        fontSize: MyFonts.size12)),
                              ),
                              padding20,
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             UserNextAppointmenyScreen(
                                  //               specialist: '',
                                  //               DoctorName: name,
                                  //               id: id,
                                  //               PatientNames: name,
                                  //               sletedDate: date,
                                  //               model: model!,
                                  //               seltedTime: time,
                                  //             )));
                                },
                                child: Container(
                                  height: 71.h,
                                  width: screensize.width / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: AppColors.white.withOpacity(0.3),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Row(
                                            children: [
                                              padding10,
                                              Image.asset(
                                                AppAssets.cal,
                                                height: 13.h,
                                                width: 13.h,
                                              ),
                                              SizedBox(width: 5.w),
                                              Text(
                                                date,
                                                style: getSemiBoldStyle(
                                                    color: AppColors.white,
                                                    fontSize: MyFonts.size12),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      padding4,
                                      FittedBox(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Row(
                                            children: [
                                              padding10,
                                              Image.asset(
                                                AppAssets.clock,
                                                height: 13.h,
                                                width: 13.h,
                                              ),
                                              SizedBox(width: 5.w),
                                              Text(
                                                time,
                                                style: getSemiBoldStyle(
                                                    color: AppColors.white,
                                                    fontSize: MyFonts.size12),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: -10,
                  child: Image.asset(
                    image,
                    height: 200.h,
                    width: 145.w,
                    fit: BoxFit.fill,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class UPopularDoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final String speciality;
  final double rating;
  final String review;
  final Function()? onTap;

  const UPopularDoctorCard(
      {super.key,
      required this.image,
      required this.name,
      this.onTap,
      required this.speciality,
      required this.rating,
      required this.review});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: AppColors.transparentColor,
      splashColor: AppColors.transparentColor,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.white,
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            CachedNetworkImage(
              imageUrl: image != ""
                  ? "${AppConstants.imageBaseUrl + image}"
                  : 'assets/images/whiteman.png',
              height: 92.h,
              width: 82.w,
              fit: BoxFit.contain,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.asset(
                'assets/images/defaultDoc.jpg',
                // Path to your default image
                height: 92.h,
                width: 82.w,
                fit: BoxFit.contain,
              ),
            ),
            // Image.asset(
            //   'assets/images/img.png', // Path to your default image
            //   height: 92.h,
            //   width: 82.w,
            //   fit: BoxFit.contain,
            // ),
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
                              color: AppColors.black,
                              fontSize: MyFonts.size18)),
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
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.ratingColor,
                        size: 13.h,
                      ),
                      SizedBox(width: 5.w),
                      Text(rating.toString(),
                          style: getMediumStyle(
                              color: AppColors.black,
                              fontSize: MyFonts.size12)),
                      SizedBox(width: 1.w),
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



class RecomondedCard extends StatelessWidget {
  const RecomondedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: AppColors.lightgrey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  AppAssets.thumb,
                  height: 18.h,
                  width: 18.w,
                ),
                SizedBox(width: 12.w),
                Text(
                  'I Recommend The Doctor',
                  style: getSemiBoldStyle(
                      color: AppColors.black, fontSize: MyFonts.size14),
                ),
              ],
            ),
            padding10,
            Text(
              '100% satisfied with doctor. She listened very carefully and inquired complete medical history',
              style: getMediumStyle(
                  color: AppColors.grey, fontSize: MyFonts.size14),
            ),
            padding12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Verified Patient',
                  style: getSemiBoldStyle(
                      color: AppColors.appColor, fontSize: MyFonts.size12),
                ),
                Text(
                  '2 days ago',
                  style: getSemiBoldStyle(
                      color: AppColors.black, fontSize: MyFonts.size12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
