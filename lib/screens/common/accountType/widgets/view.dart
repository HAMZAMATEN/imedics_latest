import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class AccountTypeCard extends StatelessWidget {
  final Function() onTap;
  final int index;
  final int selectIndex;
  final String image;
  final String title;
  final String subTitle;

  const AccountTypeCard({
    super.key,
    required this.onTap,
    required this.index,
    required this.selectIndex,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        height: 187.h,
        width: 345.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.lightgrey,
          border: Border.all(
              color: selectIndex == index
                  ? AppColors.appColor
                  : AppColors.lightgrey),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Text(
                    title,
                    style: getBoldStyle(
                        color: AppColors.black, fontSize: MyFonts.size18),
                  ),
                ),
                padding10,
                SizedBox(
                  child: SizedBox(
                    width: 185.w,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Text(
                        subTitle,
                        style: getSemiBoldStyle(
                            color: AppColors.accountTypeTextColor,
                            fontSize: MyFonts.size16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  selectIndex == index
                      ? Colors.grey.withOpacity(0.0)
                      : AppColors.lightgrey,
                  BlendMode.saturation,
                ),
                child: Image.asset(
                  image,
                  height: 176.h,
                  width: 148.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
