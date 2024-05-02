import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class JoinOfficePage extends StatelessWidget {
  const JoinOfficePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        // backgroundColor: const Color(0xff38B698).withOpacity(0.1),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        centerTitle: true,
        title: Text(
          'Join Office',
          style: getSemiBoldStyle(
              color: AppColors.black94, fontSize: MyFonts.size18),
        ),
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage(AppAssets.homeBg),
          //   fit: BoxFit.cover,
          // ),
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            children: [
              CustomTextField(
                leadingIcon: const Icon(Icons.search),
                controller: TextEditingController(),
                hintText: 'Search Office By Name',
                onChanged: (string) {},
                onFieldSubmitted: (string) {},
                obscure: false,
                label: '',
                subTitle: '',
              ),
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          padding20,
                          Container(
                            width: 85.w,
                            height: 92,
                            color: Colors.amber,
                            child: Image.asset(
                              'assets/images/home.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          padding8,
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                padding10,
                                Text(
                                  'Office Name',
                                  style: getBoldStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                Text(
                                  'Heart Specialist',
                                  style: getBoldStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                padding20,
                                Row(
                                  children: [
                                    Text(
                                      'Status:',
                                      style: getBoldStyle(
                                          color: Colors.grey, fontSize: 16),
                                    ),
                                    Text(
                                      ' Active',
                                      style: getBoldStyle(
                                          color: AppColors.appColor1,
                                          fontSize: 16),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
