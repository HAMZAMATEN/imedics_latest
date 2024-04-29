import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final double borderRadius;
  final String hintText;
  final Color? hintColor;
  VoidCallback suffixTap;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final TextInputType? inputType;
  final bool? obscure;
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
  final Function()? onTap;
  final double? radius;

   AppTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.onFieldSubmitted,
    required this.suffixTap,
    this.inputType,
    this.leadingIcon,
    this.obscure,
    this.validatorFn,
    this.hintColor,
    this.icon,
    this.tailingIcon,
    this.leadingIconPath,
    this.texfieldHeight,
    this.borderRadius = 100,
    required this.label,
    this.showLabel = true,
    this.trailingIconPath,
    this.maxLines,
    required this.subTitle,
    this.onTap,
    this.subTitleOnTap,
    this.radius,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.label != ''
                ? Text(
              widget.label,
            )
                : Container(),
            widget.subTitle != ''
                ? InkWell(
              onTap: widget.subTitleOnTap,
              child: Text(
                widget.subTitle,
                // Other existing style...
              ),
            )
                : Container()
          ],
        ),
        Container(
          height: widget.texfieldHeight ?? 70,
          child: Container(
            height: 60,
            child: TextFormField(
              onTap: widget.onTap,
              maxLines: widget.maxLines != null ? widget.maxLines : 1,
              validator: widget.validatorFn,
              obscureText: widget.obscure!,
              controller: widget.controller,
              keyboardType: widget.inputType,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.16),
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.16),
                    width: 1,
                  ),
                ),
                prefixIcon: widget.leadingIcon ??
                    (widget.leadingIconPath != null
                        ? Padding(
                      padding: const EdgeInsets.only(
                        top: 13.0,
                        bottom: 11.0,
                        left: 12.0,
                        right: 5.0,
                      ),
                      child: Image.asset(
                        widget.leadingIconPath!,
                        width: 15,
                        height: 15,
                        color: Colors.black,
                      ),
                    )
                        : null),
                errorStyle: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).colorScheme.error,
                ),
                suffixIcon: widget.trailingIconPath != null
                    ? GestureDetector(
                  onTap: widget.suffixTap,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      bottom: 11.0,
                      right: 12.0,
                      left: 12.0,
                    ),
                    child: Image.asset(
                      widget.trailingIconPath!,
                      width: 15,
                      height: 15,
                      color: Colors.grey,
                    ),
                  ),
                )
                    : null,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: widget.hintColor ?? Colors.grey,
                ),
                border: InputBorder.none,
              ),
              onFieldSubmitted: widget.onFieldSubmitted,
              onChanged: widget.onChanged,
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextFieldMaxLine extends StatelessWidget {
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

  const CustomTextFieldMaxLine({
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
