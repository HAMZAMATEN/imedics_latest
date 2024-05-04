import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imedics_latest/helpers/app_colors.dart';

class ProfileTile extends StatelessWidget {
  ProfileTile({
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