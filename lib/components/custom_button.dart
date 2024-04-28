import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.buttonText,
    this.backColor,
    this.textColor,
    this.buttonWidth,
    this.buttonHeight,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.textStyle,
    this.borderColor,
  });

  final Function()? onPressed;
  final String buttonText;
  final Color? backColor;
  final Color? textColor;
  final Color? borderColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? fontSize;
  final double? padding;
  final double? borderRadius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight ?? 54.h,
      margin: EdgeInsets.symmetric(vertical: padding ?? 10.h),
      child: RawMaterialButton(
        onPressed: onPressed,
        elevation: 2,
        fillColor: backColor ?? AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 190.r),
        ),
        child: Container(
          decoration: BoxDecoration(
              border: borderColor != null
                  ? Border.all(color: borderColor ?? backColor!)
                  : null,
              borderRadius: BorderRadius.circular(borderRadius ?? 190.r),
              gradient: backColor == null
                  ? const LinearGradient(colors: [
                      AppColors.appColor1,
                      AppColors.appColor,
                    ])
                  : null),
          // padding: EdgeInsets.symmetric(vertical: 10.h),
          width: buttonWidth ?? double.infinity,
          height: buttonHeight ?? 56.h,
          child: Center(
            child: Text(
              buttonText,
              style: textStyle ??
                  getMediumStyle(
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? MyFonts.size17),
            ),
          ),
        ),
      ),
    );
  }
}
