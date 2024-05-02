
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/controller.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/widget/doc_detail_widget.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/widget/morning_slots.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/widget/patient_app_details.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';

class SetAppointmentDetailsScreen extends StatelessWidget {
  UserDocModel doctor;
  SetAppointmentDetailsScreen({super.key,
    required this.doctor,
  });
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SetAppointmentDetailsController());
    controller.state.docId.value=doctor.sId!;
    controller.state.docName.value=doctor.name!;
    controller.setCurrentDateTimeValues();
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Select Date or Time",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,size: 15,),
          onPressed: (){Get.back();},
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   DocDetailCard(doctor: doctor),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            EasyDateTimeLine(
                              initialDate: DateTime.now().add(Duration(days: 1)),
                              onDateChange: (selectedDate) {
                                DateTime dateTime = DateTime.parse(selectedDate.toString());

                                controller.state.weekDay.value = controller.getDayName(dateTime.weekday);
                                controller.state.monthName.value = controller.getMonthName(dateTime.month);

                                // print(dateTime.weekday.toString());

                                int year = dateTime.year;
                                int month = dateTime.month;
                                int day = dateTime.day;

                                controller.state.year.value = year.toString();
                                controller.state.month.value = month.toString();
                                controller.state.date.value = day.toString();
                                // print("Year: $year");
                                // print("Month: $month");
                                // print("Day: $day");
                                //`selectedDate` the new date selected.
                              },
                              headerProps: const EasyHeaderProps(
                                monthPickerType: MonthPickerType.switcher,
                                dateFormatter: DateFormatter.fullDateDMY(),
                              ),
                              dayProps: const EasyDayProps(
                                dayStructure: DayStructure.dayStrDayNum,
                                activeDayStyle: DayStyle(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xff5EEF8F),
                                        Color(0xff00A69D),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.sunny,color: AppColors.appColor,),
                                SizedBox(width: 10.w,),
                                Text('Morning Slots',style: getSemiBoldStyle(color: AppColors.black,fontSize: 15),),
                              ],
                            ),
                            SizedBox(height: 20.w,),
                            Obx(() => Padding(
                              padding:  EdgeInsets.only(left: 10.w),
                              child: Container(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: morningSlotRow(controller),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() => InkWell(
                          onTap: (){
                            // print((DateTime.parse('${controller.state.year.value}-${controller.state.month.value}-${controller.state.date.value}')).toString());
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.black54),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
                              child: Center(child: Text("${controller.state.weekDay.value} ${controller.state.date.value} ${controller.state.monthName.value}, ${controller.state.time.value}",style: getSemiBoldStyle(color: AppColors.black,fontSize: 15))),
                            ),
                          ),
                        ),),
                        SizedBox(height: 10.h,),
                        InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: (){
                            Get.to(()=>PatientDetailsView(controller: controller,doctor: doctor,));
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.black54),
                              gradient: LinearGradient(
                                colors: [Color(0xff5EEF8F),
                                  Color(0xff00A69D),],
                              ),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
                              child: Center(child: Text("Next",style: getSemiBoldStyle(color: AppColors.black,fontSize: 15)),),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
