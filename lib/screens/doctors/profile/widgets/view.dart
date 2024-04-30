import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imedics_latest/helpers/app_colors.dart';

class DoctorProfileTile extends StatelessWidget {
  DoctorProfileTile({
    super.key,
    required this.text,
    this.index,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;
  final index;

  List icon = [
    'assets/icons/icons/profile.svg',
    'assets/icons/icons/Wallet-one.svg',
    'assets/icons/icons/Bank-card.svg',
    'assets/icons/icons/Setting-two.svg',
    'assets/icons/icons/Help.svg',
    'assets/icons/icons/Info.svg',
    'assets/icons/icons/Logout.svg',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 46.h,
          child: ListTile(
            onTap: onPressed,
            dense: true,
            leading: SvgPicture.asset(
              icon[index],
              width: 20,
              height: 20,
            ),
            title: Text(
              text,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Image.asset('assets/images/arrow.png'),
          ),
        ),
        Divider(
          thickness: 1,
          color: AppColors.grey.withOpacity(0.2),
        )
      ],
    );
  }
}


class CommonpositionPicture extends StatelessWidget {
  const CommonpositionPicture(
      {super.key, required this.onPressed, required this.picturepath});
  final VoidCallback onPressed;
  final String picturepath;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -70,
      right: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  color: AppColors.grey.withOpacity(0.20),
                  child: Image.asset(
                    picturepath,
                    height: 130,
                    width: 130,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
