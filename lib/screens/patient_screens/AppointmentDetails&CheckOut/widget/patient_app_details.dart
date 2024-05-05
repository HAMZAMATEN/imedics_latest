import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/custom_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/checkOutWidgets/select_account_type.dart';
import 'package:imedics_latest/screens/patient_screens/AppointmentDetails&CheckOut/controller.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class PatientDetailsView extends StatelessWidget {
  SetAppointmentDetailsController controller;
  UserDocModel doctor;
  PatientDetailsView({super.key,required this.controller,required this.doctor});


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appColor.withOpacity(0.5),
          title: Text(
            'Patient Details',
            style: getBoldStyle(color: Colors.black,fontSize: MyFonts.size18),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: 1.sh,
          width: 1.sw,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.homeBg),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.030,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Booking For',
                        style: getSemiBoldStyle(color: Colors.black,fontSize: MyFonts.size15),

                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 5.w),
                        child: DropdownButtonFormField<String>(
                          hint: Text(controller.state.bookingFor.value),
                          items: [
                            DropdownMenuItem(child: Text("Self",style: getRegularStyle(color: Colors.black),),value: 'self',),
                            DropdownMenuItem(child: Text("Others",style: getRegularStyle(color: Colors.black),),value: 'other',),
                          ],
                          onChanged: (String? value) {
                            print(value);
                            controller.state.bookingFor.value=value!;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.w),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.w),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.w),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.030,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Gender',
                        style: getSemiBoldStyle(color: Colors.black,fontSize: MyFonts.size15),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      height: 60,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 5.w),
                        child: DropdownButtonFormField<String>(
                          hint: Text(controller.state.gender.value),
                          items: [
                            DropdownMenuItem(child: Text('Male',style: getRegularStyle(color: Colors.black),),value: 'male',),
                            DropdownMenuItem(child: Text('Female',style: getRegularStyle(color: Colors.black),),value: 'female',),
                            DropdownMenuItem(child: Text('Other',style: getRegularStyle(color: Colors.black),),value: 'other',),
                          ],
                          onChanged: (String? value) {
                            print(value);
                            controller.state.gender.value=value!;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.w),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.w),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.w),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),


                    SizedBox(
                      height: screenHeight * 0.030,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Patient Age',
                        style: getSemiBoldStyle(color: Colors.black,fontSize: MyFonts.size15),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 5.w),
                        child: DropdownButtonFormField<String>(
                          hint: Text(controller.state.age.value),
                          items: [
                            DropdownMenuItem(child: Text('15 Years',style: getRegularStyle(color: Colors.black),),value: '15 Years',),
                            DropdownMenuItem(child: Text('20 Years',style: getRegularStyle(color: Colors.black),),value: '20 Years',),
                            DropdownMenuItem(child: Text('25 Years',style: getRegularStyle(color: Colors.black),),value: '25 Years',),
                            DropdownMenuItem(child: Text('30 Years',style: getRegularStyle(color: Colors.black),),value: '30 Years',),
                            DropdownMenuItem(child: Text('40 Years',style: getRegularStyle(color: Colors.black),),value: '40 Years',),
                            DropdownMenuItem(child: Text('45 Years',style: getRegularStyle(color: Colors.black),),value: '45 Years',),
                            DropdownMenuItem(child: Text('Above 45',style: getRegularStyle(color: Colors.black),),value: 'Above 45',),
                          ],
                          onChanged: (String? value) {
                            print(value);
                            controller.state.age.value=value!;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.w),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.w),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.w),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.030,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Details',
                        style: getSemiBoldStyle(color: Colors.black,fontSize: MyFonts.size15),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: screenWidth,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextField(
                          controller: controller.state.detailsController,
                          decoration: InputDecoration(
                            hintText: 'Write here....',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none, // Remove underline
                          ),
                          maxLines:
                          null, // Allow TextField to expand vertically
                          expands:
                          true, // Allow TextField to take all available vertical space
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.040,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      // child: NextButton(
                      //     back: () {},
                      //     onPressed: () {
                      //       Get.to(()=>PaymentAccountType(appController: controller,));
                      //       // // controller.backDetails();
                      //       // Navigator.push(
                      //       //     context,
                      //       //     MaterialPageRoute(
                      //       //         builder: (context) =>
                      //       //             PaymentAccountType()));
                      //       //  Navigator.pushNamed(
                      //       //        context, AppRoutes.addPaymentScreen);
                      //     },
                      //     isbackbuton: false,
                      //     text: 'Next'),
                      child: CustomButton(buttonText: 'Next',
                        onPressed: (){
                        print("Pateint detail time");
                        print(controller.state.time.value);
                        Get.to(()=>UserSelectAccountTypeView(appController: controller,doctor: doctor,));
                          // handle appointment details screen
                        // Get.to(()=>PaymentAccountType(appController: controller,));

                        },
                      ),
                    ),
                  ],
                ),),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
