import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:imedics_latest/components/session_button.dart';
import 'package:imedics_latest/utils/app_paddings.dart';

class TimingTabView extends StatefulWidget {
  const TimingTabView({super.key});

  @override
  State<TimingTabView> createState() => _timingpageState();
}

class _timingpageState extends State<TimingTabView> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListTile(
                leading: Image.asset(
                  'assets/images/calendar.png',
                  color: Color(0xff00A69D),
                  height: 15.h,
                  width: 15.w,
                ),
                title: Text('Weekly Stats'),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 7,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.8, crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 12, top: 8),
                      height: 42,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xff88909859).withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text(weekDays[index]),
                      ),
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/sun.png',
                  color: Color(0xff00A69D),
                  height: 15.h,
                ),
                title: Text(
                  'Morning Status',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                children: [0, 1]
                    .map((e) => Container(
                  margin: EdgeInsets.only(left: 12),
                  height: 42,
                  width: 110,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(0xff88909859).withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text('10:20:00'),
                  ),
                ))
                    .toList(),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/moon.png',
                  color: Color(0xff00A69D),
                  height: 15.h,
                ),
                title: Text(
                  'Evening Status',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                children: [0, 1]
                    .map((e) => Container(
                  margin: EdgeInsets.only(left: 12),
                  height: 42,
                  width: 110,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(0xff88909859).withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text('10:20:00'),
                  ),
                ))
                    .toList(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Consultation Fees',
                    style:  TextStyle(
                            fontSize: 16,
                            color: Color(0XFF31333B),
                            fontWeight: FontWeight.w700)),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      'Max Duration 30 Minutes',
                      style:  TextStyle(
                              fontSize: 16,
                              color: Color(0xff888888),
                              fontWeight: FontWeight.w600)),

                    Spacer(),
                    Text(
                      '\$22',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xff00A69D)),
                    )
                  ],
                ),
              ),
              padding20,
              Align(
                alignment: Alignment.bottomCenter,
                child: SessionButton(
                  text: 'Done',
                  back: () {},
                  onPressed: () {

                    // print("Doc id is");
                    // print(docId!);
                    // Get.to(AppointmentDateTime(time: "14", date: "15"));
                    // Get.to(Appointment(id: "1231", docId: "123", userId: "123"));
                    // Get.to(()=>DoctorMainMenuScreenMain());
                    //   Get.to(()=> LabPaymentScreen());

                  }
                  ,
                  isbackbuton: true,
                ),
              )

            ],
          ),
        ));
  }
}

List<String> weekDays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursady',
  'Friday',
  'Saturday',
  'Sunday'
];
