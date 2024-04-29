import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class CommonPassTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? hintColor;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final TextInputType? inputType;
  final bool obscure;
  final IconData? icon;
  final String? Function(String?)? validatorFn;
  final Widget? leadingIcon;
  final Widget? tailingIcon;
  final String? leadingIconPath;
  final String? trailingIconPath;
  final double? texfieldHeight;
  final String label;
  final bool showLabel;
  final int? maxLines;
  final String subTitle;
  final Function()? subTitleOnTap;

  const CommonPassTextField(
      {Key? key,
        required this.controller,
        required this.hintText,
        required this.onChanged,
        required this.onFieldSubmitted,
        this.inputType,
        this.leadingIcon,
        required this.obscure,
        this.validatorFn,
        this.hintColor,
        this.icon,
        this.tailingIcon,
        this.leadingIconPath,
        this.texfieldHeight,
        required this.label,
        this.showLabel = true,
        this.trailingIconPath,
        this.maxLines,
        required this.subTitle,
        this.subTitleOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            label != ''
                ? Text(
              label,
              style: getSemiBoldStyle(
                  fontSize: MyFonts.size14,
                  color: AppColors.checkboxColor),
            )
                : Container(),
            subTitle != ''
                ? InkWell(
              onTap: subTitleOnTap,
              child: Text(
                subTitle,
                style: getMediumStyle(
                    color: AppColors.appColor, fontSize: MyFonts.size12),
              ),
            )
                : Container()
          ],
        ),
        Container(
          constraints: texfieldHeight != null
              ? BoxConstraints(minHeight: texfieldHeight!)
              : BoxConstraints(minHeight: 62.h),
          margin: EdgeInsets.only(bottom: 5.h, top: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: AppColors.loginScreenTextColor.withOpacity(0.16),
                width: 1.w),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: TextFormField(
            maxLines: maxLines != null ? maxLines : 1,
            validator: validatorFn,
            obscureText: obscure,
            controller: controller,
            keyboardType: inputType,
            style:
            getMediumStyle(fontSize: MyFonts.size16, color: AppColors.black),
            decoration: InputDecoration(
              contentPadding: tailingIcon != null
                  ? EdgeInsets.only(top: 15, left: 20.w)
                  : EdgeInsets.symmetric(horizontal: 20.w),
              prefixIcon: leadingIconPath != null
                  ? Padding(
                padding: EdgeInsets.all(13.0.h),
                child: Image.asset(
                  leadingIconPath!,
                  width: 15.w,
                  height: 15.h,
                ),
              )
                  : null,
              errorStyle: getRegularStyle(
                  fontSize: MyFonts.size10,
                  color: Theme.of(context).colorScheme.error),
              suffixIcon: tailingIcon,
              hintText: hintText,
              hintStyle: getLightStyle(
                  fontSize: MyFonts.size16,
                  color: hintColor ?? AppColors.loginScreenTextColor),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10.r),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10.r),
              // ),
              border: InputBorder.none,
              // focusedErrorBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10.r),
              // ),
              // errorBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10.r),
              // ),
            ),
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

class CommonPassTextFieldMaxLine extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? hintColor;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final TextInputType? inputType;
  final bool obscure;
  final IconData? icon;
  final String? Function(String?)? validatorFn;
  final Widget? leadingIcon;
  final Widget? tailingIcon;
  final String? leadingIconPath;
  final String? trailingIconPath;
  final double? texfieldHeight;
  final String label;
  final bool showLabel;
  final int? maxLines;

  const CommonPassTextFieldMaxLine({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.onFieldSubmitted,
    this.inputType,
    this.leadingIcon,
    required this.obscure,
    this.validatorFn,
    this.hintColor,
    this.icon,
    this.tailingIcon,
    this.leadingIconPath,
    this.texfieldHeight,
    required this.label,
    this.showLabel = true,
    this.trailingIconPath,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != ''
            ? Text(
          label,
          style: getSemiBoldStyle(
              fontSize: MyFonts.size14, color: AppColors.checkboxColor),
        )
            : Container(),
        Container(
          constraints: texfieldHeight != null
              ? BoxConstraints(minHeight: texfieldHeight!)
              : BoxConstraints(minHeight: 62.h),
          margin: EdgeInsets.only(bottom: 5.h, top: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: AppColors.loginScreenTextColor.withOpacity(0.16),
                width: 1.w),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: TextFormField(
            maxLines: maxLines != null ? maxLines : 1,
            validator: validatorFn,
            obscureText: obscure,
            controller: controller,
            keyboardType: inputType,
            style:
            getMediumStyle(fontSize: MyFonts.size16, color: AppColors.black),
            decoration: InputDecoration(
              contentPadding: trailingIconPath != null
                  ? EdgeInsets.only(top: 15, left: 20.w)
                  : EdgeInsets.symmetric(horizontal: 20.w),
              prefixIcon: leadingIconPath != null
                  ? Padding(
                padding: EdgeInsets.all(13.0.h),
                child: Image.asset(
                  leadingIconPath!,
                  width: 15.w,
                  height: 15.h,
                ),
              )
                  : null,
              errorStyle: getRegularStyle(
                  fontSize: MyFonts.size10,
                  color: Theme.of(context).colorScheme.error),
              suffixIcon: trailingIconPath != null
                  ? Padding(
                padding: EdgeInsets.all(14.0.h),
                child: Image.asset(
                  trailingIconPath!,
                  width: 15.w,
                  height: 15.h,
                ),
              )
                  : null,

              hintText: hintText,
              hintStyle: getLightStyle(
                  fontSize: MyFonts.size16,
                  color: hintColor ?? AppColors.loginScreenTextColor),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10.r),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10.r),
              // ),
              border: InputBorder.none,
              // focusedErrorBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10.r),
              // ),
              // errorBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10.r),
              // ),
            ),
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
