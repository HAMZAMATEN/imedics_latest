import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/profile_screens/profile_screens/wallet_screen/widgets/WalletAddAmountScreen.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

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
                                  color: Colors.white,
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
                                        color: AppColors.white,
                                        fontSize: MyFonts.size26),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Container(
                                  height: 120.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      border: Border.all(
                                          color: Colors.white.withOpacity(0.5)),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      )),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/icons/Wallet-one.svg',
                                          height: 50.h,
                                          width: 50.w,
                                          color: Colors.white,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text('Available Balance',
                                                style: getSemiBoldStyle(
                                                    color: Colors.white)),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              '\$1220',
                                              style: getSemiBoldStyle(
                                                  color: Colors.white,
                                                  fontSize: MyFonts.size36),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height - 250.h,
                                decoration: BoxDecoration(
                                    color: AppColors.bgColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    )),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            "Transaction History",
                                            style: getSemiBoldStyle(
                                                color: Colors.black54,
                                                fontSize: MyFonts.size24),
                                          ),
                                          padding4,
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            child: Divider(
                                              color: Colors.black12,
                                            ),
                                          ),
                                          padding4,
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 50.h),
                                        child: ListView.builder(
                                            itemCount: 15,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                leading: Image.asset('assets/icons/outgoing_arrow.png',height: 40.h,width: 40.w,),
                                                title: Text(
                                                  "\$100",
                                                  style: getSemiBoldStyle(
                                                      color: Colors.black,
                                                      fontSize: MyFonts.size20),
                                                ),
                                                subtitle: Text(
                                                  "Transaction Id #25569",
                                                  style: getRegularStyle(
                                                      color: Colors.black26,
                                                      fontSize: MyFonts.size14),
                                                ),
                                                trailing: Container(
                                                  height: 30.h,
                                                  width: 100.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(100),
                                                    border: Border.all(color: Color(0xff00A69D),),
                                                    color: Colors.transparent
                                                  ),
                                                  child: Center(
                                                    child: Text("E-Receipt"),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomButton(buttonText: "Top up",
                              onPressed: (){
                              Get.to(()=>WalletAddAmountScreen());
                              },
                            ),
                            CustomButton(buttonText: "Request Withdraw",
                              onPressed: (){},
                              backColor: Colors.white,
                              borderColor: Colors.black54,
                              textColor: Colors.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
