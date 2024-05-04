import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/profile/widgets/view.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class DoctorWalletWithdraw extends StatefulWidget {
  const DoctorWalletWithdraw({super.key});

  @override
  State<DoctorWalletWithdraw> createState() => _DoctorWalletWithdrawState();
}

class _DoctorWalletWithdrawState extends State<DoctorWalletWithdraw>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  int selectdpage = 0;

  @override
  Widget build(BuildContext context) {
    // final mainMenuCtr = ref.watch(dProfileMainprovider);
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.appColor1,
                  AppColors.appColor,
                ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 90.w, top: 50.h),
                        child: Image.asset(
                          AppAssets.loginBg,
                          height: 272.h,
                          width: 307.7.w,
                          color: AppColors.white.withOpacity(0.1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset(
                          AppAssets.bgGradient,
                        ),
                      ),
                      Positioned(
                        top: 30.h,
                        left: 0,
                        child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ))),
                      ),
                      Positioned(
                        top: 35.h,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Wallet',
                                    style: getBoldStyle(
                                        color: AppColors.black,
                                        fontSize: MyFonts.size26),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Expanded(
              //     flex: 5,
              //     child: DoctorwalletAmount(
              //       onPressed: () {},
              //       tabController: _tabController,
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
