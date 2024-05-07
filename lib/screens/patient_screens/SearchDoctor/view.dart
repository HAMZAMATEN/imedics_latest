import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/patient_screens/All_Specialization/view.dart';
import 'package:imedics_latest/screens/patient_screens/All_Specialization/widgets/specialized_doc_card.dart';
import 'package:imedics_latest/screens/patient_screens/home/controller.dart';
import 'package:imedics_latest/utils/app_assets.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class SearchDoctorScreen extends StatefulWidget {
  UserHomeController controller ;
   SearchDoctorScreen({super.key,required this.controller});

  @override
  State<SearchDoctorScreen> createState() => _SearchDoctorScreenState();
}

class _SearchDoctorScreenState extends State<SearchDoctorScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(() {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Search Doctor",style: getBoldStyle(color: Colors.black,fontSize: MyFonts.size16),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,size: 20.sp,)),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              padding10,
              Container(
                height: 55.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(0.5))
                ),
                child: Center(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.w),
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: [
                    //         Image.asset(AppAssets.search,height: 20.h,width: 20.w,),
                    //         SizedBox(width: 10.w,),
                    //         Text('Search Doctor / Condition',style: getRegularStyle(color: Colors.grey),),
                    //       ],
                    //     ),
                    //     Image.asset(AppAssets.filter,height: 20.h,width: 20.w,),
                    //   ],
                    // ),
                    child: Center(
                      child: TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.search,color: AppColors.appColor),
                          suffixIcon:  InkWell(
                              onTap: (){
                               Get.to( ()=>AllSpecializationView(controller: widget.controller));
                              },
                              child: Icon(Icons.filter_list_outlined,color: Colors.black54)),
                          hintText: "Search by Name/Specialization",
                          hintStyle: getRegularStyle(color: Colors.black54,fontSize: MyFonts.size16),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          )
                        ),
                      ),
                    ),
                  ),
                ),

              ),
              padding10,
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: widget.controller.state.doctorsList.length,
                  itemBuilder: (context,index){
                    if(widget.controller.state.doctorsList[index].name!.contains(searchController.text) || widget.controller.state.doctorsList[index].specialization!.contains(searchController.text)){
                      return DocDetailCard(doctor: widget.controller.state.doctorsList[index]);
                    }else {
                      return Container();
                    }

                  }
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
