import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/helpers/app_colors.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: AppColors.themeOrangeColor,
    scaffoldBackgroundColor:AppColors.white,
    appBarTheme: AppBarTheme(centerTitle: false, elevation: 0, color: AppColors.themeOrangeColor),
    iconTheme: const IconThemeData(color: AppColors.themeOrangeColor),

    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => AppColors.lightContainerColor),
      overlayColor:  MaterialStateColor.resolveWith((states) => AppColors.themeOrangeColor),
    ),

    colorScheme: const ColorScheme.light(
        primary: AppColors.textColor ,
        onPrimary: AppColors.themeOrangeColor,
        secondary: AppColors.textLightColor,
        primaryContainer: AppColors.lightContainerColor,
        secondaryContainer:AppColors.black,
        error: AppColors.red
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1.h,
      backgroundColor: AppColors.lightContainerColor,
      selectedItemColor: AppColors.textColor,
      unselectedItemColor: AppColors.textLightColor,
      selectedIconTheme: const IconThemeData(color: AppColors.textLightColor),
      showUnselectedLabels: true,
    ),
  );
}
