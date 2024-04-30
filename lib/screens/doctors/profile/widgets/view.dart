import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/session_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/profile/screens/wallet_withdraw.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';

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

//*********************Wallet Screen Widgets*****************8

class DoctorWalletPoint extends StatelessWidget {
  DoctorWalletPoint(
      {super.key, required this.onPressed, required this.tabController});

  final VoidCallback onPressed;
  final TabController tabController;

  final TextEditingController namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -120,
          left: 0,
          right: 0,
          child: Container(
            height: 160,
            color: Colors.white.withOpacity(0.30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/wallepng.png',
                        height: 30,
                        width: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            'Total Earning:',
                            style: getBoldStyle(color: AppColors.white),
                          ),
                          Text(
                            '\$1354.46',
                            style: getBoldStyle(
                                color: AppColors.white, fontSize: 23),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Available Balance',
                        style: getBoldStyle(color: AppColors.white),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$1612.458',
                            style: getBoldStyle(
                                color: AppColors.black, fontSize: 23),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          width: 1.sw,
          decoration: const BoxDecoration(
            color: AppColors.lightBg,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.lightgrey,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: TabBar(
                      indicatorPadding: EdgeInsets.zero,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      controller: tabController,
                      indicator: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          AppColors.appColor1,
                          AppColors.appColor,
                        ]),
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: Colors.green,
                      ),
                      labelColor: AppColors.white,
                      unselectedLabelColor: AppColors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      tabs: [
                        Tab(
                          child: SizedBox(
                            width: 170.w,
                            child: const Center(child: Text('ALL')),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            width: 170.w,
                            child: const Center(child: Text('Earning')),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            width: 170.w,
                            child: const Center(child: Text('Withdraw')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  padding10,
                  Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return const DoctorWalletListtile();
                          })),
                  SessionButton(
                      back: () {},
                      onPressed: () {
                        Get.to(() => DoctorWalletWithdraw(),);
                        // Navigator.pushNamed(
                        //     context, AppRoutes.doctorwalletAmountScreen);
                      },
                      isbackbuton: false,
                      text: 'Wallet Withdraw')
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DoctorWalletListtile extends StatelessWidget {
  const DoctorWalletListtile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(AppAssets.arrowsent),
      trailing: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.appColor1)),
        width: 100,
        height: 40,
        child: Center(
          child: Text(
            'E-Receipt',
            style: getBoldStyle(color: AppColors.appColor1, fontSize: 13),
          ),
        ),
      ),
      subtitle: Text(
        'Transaction ID # 3789',
        style: getBoldStyle(color: AppColors.grey, fontSize: 12),
      ),
      title: Text(
        '\$100',
        style: getBoldStyle(color: Colors.black, fontSize: 22),
      ),
    );
  }
}

class DoctorwalletAmount extends StatefulWidget {
  const DoctorwalletAmount(
      {super.key, required this.onPressed, required this.tabController});

  final VoidCallback onPressed;
  final TabController tabController;

  @override
  State<DoctorwalletAmount> createState() => _DoctorwalletAmountState();
}

class _DoctorwalletAmountState extends State<DoctorwalletAmount> {
  final TextEditingController namecontroller = TextEditingController();
  String input = '';

  void _onButtonPressed(String buttonText) {
    setState(() {
      input += buttonText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -110,
          left: 0,
          right: 0,
          child: Container(
            height: 150,
            color: Colors.white.withOpacity(0.30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Available Balance',
                        style: getBoldStyle(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$1612.458',
                        style:
                            getBoldStyle(color: AppColors.white, fontSize: 32),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          width: 1.sw,
          decoration: const BoxDecoration(
            color: AppColors.lightBg,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter Withdraw Amount',
                        style: getBoldStyle(
                            color: AppColors.black, fontSize: 16.h),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$$input',
                        style: getBoldStyle(
                            color: AppColors.appColor1, fontSize: 40.h),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.grey.withOpacity(0.20),
                  ),
                  Row(
                    children: ['50', '100', '200']
                        .map((e) => Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    input = e;
                                  });
                                },
                                child: Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.grey.withOpacity(0.50),
                                      ),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                    child: Text('\$ $e'),
                                  ),
                                ),
                              ),
                            )))
                        .toList(),
                  ),
                  padding10,
                  buildrow(['1', '2', '3']),
                  buildrow(['4', '5', '6']),
                  buildrow(['7', '8', '9']),
                  buildrow(['.', '0', 'CE']),
                  SessionButton(
                      back: () {},
                      onPressed: () {

                      },
                      isbackbuton: false,
                      text: 'Continue')
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  buildrow(List demolist) {
    return Row(
      children: demolist
          .map((e) => Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    if (e == 'CE') {
                      input = '';
                      print('ce');
                      setState(() {});
                    } else if (e == '.') {
                      _onButtonPressed('.');
                    } else {
                      var intparsed = int.parse(e);
                      _onButtonPressed(intparsed.toString());
                    }
                    // if (intparsed != null) {
                    //   _onButtonPressed(intparsed.toString());
                    //   print(input);
                    // }
                  },
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.10),
                      border: Border.all(
                        color: AppColors.grey.withOpacity(0.50),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '$e',
                        style:
                            getBoldStyle(color: AppColors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              )))
          .toList(),
    );
  }
}
