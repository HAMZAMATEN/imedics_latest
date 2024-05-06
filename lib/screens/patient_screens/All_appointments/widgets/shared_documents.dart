// AnimatedContainer(
// duration: const Duration(milliseconds: 300),
// padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
// curve: Curves.easeInOut,
// width: MediaQuery.of(context).size.width,
// // height: 126.h,
// decoration: BoxDecoration(
// color: AppColors.white,
// borderRadius: BorderRadius.circular(5.r),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Shared Documents',
// style:
// getBoldStyle(color: AppColors.black, fontSize: 16.sp),
// ),
// padding16,
// StreamBuilder<QuerySnapshot>(
// stream: FirebaseFirestore.instance
//     .collection(AppConstants.userCollection)
//     .where('id',
// isEqualTo:
// "${AppConstants.userId}")
//     .snapshots(),
// builder:
// (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// if (!snapshot.hasData) {
// return Center(child: ShowProgressIndicator());
// }
// return snapshot.data!.docs.isEmpty
// ? Center(
// child: Text(
// 'No documents shared yet',
// style:
// getSemiBoldStyle(color: Colors.black),
// ),
// )
//     : ListView.builder(
// shrinkWrap: true,
// physics: NeverScrollableScrollPhysics(),
// itemCount: snapshot.data!.docs.length,
// itemBuilder: (context, index) {
// return
//
// snapshot.data!.docs[index]
// ['Blood-Report'] ==
// 0 ||
// snapshot.data!.docs[index]
// ['CT-Scan'] ==
// 0
// ||
// snapshot.data!.docs[index]
// ['MRI'] ==
// 0
// ?
// Center(
// child: Text(
// 'No documents shared yet',
// style:
// getSemiBoldStyle(color: Colors.black),
// ),
// )
//     :
// snapshot.data!.docs[index]
// ['Blood-Report'] ==
// 0
// ? Container()
//     : Row(
// children: [
// Container(
// height: 75.h,
// width: 81.w,
// // padding: EdgeInsets.all(10),
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(
// 5.r),
// border: Border.all(
// color: Color.fromRGBO(
// 136, 144, 152, 0.85),
// width: 1.2,
// ),
// color: Color.fromRGBO(
// 136, 144, 152, 0.1),
// ),
// child: Center(
// child: Container(
// height: 43.h,
// width: 43.w,
// child: Image.asset(
// AppAssets.bloodRep,
// color: AppColors.appColor,
// ),
// ),
// ),
// ),
// SizedBox(
// width: 20.w,
// ),
// Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text(
// 'Blood Report',
// style: getBoldStyle(
// color: AppColors.black,
// fontSize: 18.sp,
// ),
// ),
// // FutureBuilder<PatientModel>(
// //     future: recordController
// //         .fetchParticularPatientDetails(
// //         snapshot.data!.docs[index]['id'.toString()]),
// //     builder: (context,
// //         AsyncSnapshot<
// //             PatientModel>
// //         snapshot) {
// //         if (!snapshot.hasData) {
// //             return Container(
// //                 height: 30.h,
// //                 child:
// //                 ShowProgressIndicator());
// //         }
// //         return Text(
// //             "Shared By: "+snapshot.data!.username
// //                 .toString(),
// //             style: getBoldStyle(
// //                 color:
// //                 AppColors.appColor,
// //                 fontSize:
// //                 MyFonts.size16),
// //         );
// //     }),
// SizedBox(
// height: 4.w,
// ),
// Text(
// '${snapshot.data!.docs[index]['Blood-Report'].length} Document',
// style: getBoldStyle(
// color: Color.fromRGBO(
// 136, 136, 136, 1),
// fontSize: 14.sp,
// ),
// ),
// ],
// ),
// ],
// );
// });
// }),
// padding16,
// StreamBuilder<QuerySnapshot>(
// stream: FirebaseFirestore.instance
//     .collection(AppConstants.userCollection)
//     .where('id',
// isEqualTo:
// "${AppConstants.userId}")
//     .snapshots(),
// builder:
// (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// if (!snapshot.hasData) {
// return Center(child: ShowProgressIndicator());
// }
// return ListView.builder(
// shrinkWrap: true,
// physics: NeverScrollableScrollPhysics(),
// itemCount: snapshot.data!.docs.length,
// itemBuilder: (context, index) {
// return snapshot.data!.docs[index]['MRI'].length == 0
// ? Container()
//     : Row(
// children: [
// Container(
// height: 75.h,
// width: 81.w,
// // padding: EdgeInsets.all(10),
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(5.r),
// border: Border.all(
// color: Color.fromRGBO(
// 136, 144, 152, 0.85),
// width: 1.2,
// ),
// color: Color.fromRGBO(
// 136, 144, 152, 0.1),
// ),
// child: Center(
// child: Container(
// height: 43.h,
// width: 43.w,
// child: Image.asset(
// AppAssets.mri,
// color: AppColors.appColor,
// ),
// ),
// ),
// ),
// SizedBox(
// width: 20.w,
// ),
// Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text(
// 'MRI',
// style: getBoldStyle(
// color: AppColors.black,
// fontSize: 18.sp,
// ),
// ),
// // FutureBuilder<PatientModel>(
// //     future: recordController
// //         .fetchParticularPatientDetails(
// //         snapshot.data!.docs[index]['id'.toString()]),
// //     builder: (context,
// //         AsyncSnapshot<
// //             PatientModel>
// //         snapshot) {
// //         if (!snapshot.hasData) {
// //             return Container(
// //                 height: 30.h,
// //                 child:
// //                 ShowProgressIndicator());
// //         }
// //         return Text(
// //             "Shared By: "+snapshot.data!.username
// //                 .toString(),
// //             style: getBoldStyle(
// //                 color:
// //                 AppColors.appColor,
// //                 fontSize:
// //                 MyFonts.size16),
// //         );
// //     }),
// SizedBox(
// height: 4.w,
// ),
// Text(
// '${snapshot.data!.docs[index]['MRI'].length} Document',
// style: getBoldStyle(
// color: Color.fromRGBO(
// 136, 136, 136, 1),
// fontSize: 14.sp,
// ),
// ),
// ],
// ),
// ],
// );
// });
// }),
// padding16,
// StreamBuilder<QuerySnapshot>(
// stream: FirebaseFirestore.instance
//     .collection(AppConstants.userCollection)
//     .where('id',
// isEqualTo:
// "${AppConstants.userId}")
//     .snapshots(),
// builder:
// (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// if (!snapshot.hasData) {
// return Center(child: ShowProgressIndicator());
// }
// return ListView.builder(
// shrinkWrap: true,
// physics: NeverScrollableScrollPhysics(),
// itemCount: snapshot.data!.docs.length,
// itemBuilder: (context, index) {
// return snapshot.data!.docs[index]['CT-Scan'].length ==
// 0
// ? Row(
// children: [
// Container(
// height: 75.h,
// width: 81.w,
// // padding: EdgeInsets.all(10),
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(5.r),
// border: Border.all(
// color: Color.fromRGBO(
// 136, 144, 152, 0.85),
// width: 1.2,
// ),
// color: Color.fromRGBO(
// 136, 144, 152, 0.1),
// ),
// child: Center(
// child: Container(
// height: 43.h,
// width: 43.w,
// child: Image.asset(
// AppAssets.ctscan,
// color: AppColors.appColor,
// ),
// ),
// ),
// ),
// SizedBox(
// width: 20.w,
// ),
// Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text(
// 'CT-Scan',
// style: getBoldStyle(
// color: AppColors.black,
// fontSize: 18.sp,
// ),
// ),
// // FutureBuilder<PatientModel>(
// //     future: recordController
// //         .fetchParticularPatientDetails(
// //         snapshot.data!.docs[index]['id'.toString()]),
// //     builder: (context,
// //         AsyncSnapshot<
// //             PatientModel>
// //         snapshot) {
// //         if (!snapshot.hasData) {
// //             return Container(
// //                 height: 30.h,
// //                 child:
// //                 ShowProgressIndicator());
// //         }
// //         return Text(
// //             "Shared By: "+snapshot.data!.username
// //                 .toString(),
// //             style: getBoldStyle(
// //                 color:
// //                 AppColors.appColor,
// //                 fontSize:
// //                 MyFonts.size16),
// //         );
// //     }),
// SizedBox(
// height: 4.w,
// ),
// Text(
// 'No documents',
// style: getBoldStyle(
// color: Color.fromRGBO(
// 136, 136, 136, 1),
// fontSize: 14.sp,
// ),
// ),
// ],
// ),
// ],
// )
//     : Row(
// children: [
// Container(
// height: 75.h,
// width: 81.w,
// // padding: EdgeInsets.all(10),
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(5.r),
// border: Border.all(
// color: Color.fromRGBO(
// 136, 144, 152, 0.85),
// width: 1.2,
// ),
// color: Color.fromRGBO(
// 136, 144, 152, 0.1),
// ),
// child: Center(
// child: Container(
// height: 43.h,
// width: 43.w,
// child: Image.asset(
// AppAssets.ctscan,
// color: AppColors.appColor,
// ),
// ),
// ),
// ),
// SizedBox(
// width: 20.w,
// ),
// Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text(
// 'CT-Scan',
// style: getBoldStyle(
// color: AppColors.black,
// fontSize: 18.sp,
// ),
// ),
// // FutureBuilder<PatientModel>(
// //     future: recordController
// //         .fetchParticularPatientDetails(
// //         snapshot.data!.docs[index]['id'.toString()]),
// //     builder: (context,
// //         AsyncSnapshot<
// //             PatientModel>
// //         snapshot) {
// //         if (!snapshot.hasData) {
// //             return Container(
// //                 height: 30.h,
// //                 child:
// //                 ShowProgressIndicator());
// //         }
// //         return Text(
// //             "Shared By: "+snapshot.data!.username
// //                 .toString(),
// //             style: getBoldStyle(
// //                 color:
// //                 AppColors.appColor,
// //                 fontSize:
// //                 MyFonts.size16),
// //         );
// //     }),
// SizedBox(
// height: 4.w,
// ),
// Text(
// '${snapshot.data!.docs[index]['CT-Scan'].length} Document',
// style: getBoldStyle(
// color: Color.fromRGBO(
// 136, 136, 136, 1),
// fontSize: 14.sp,
// ),
// ),
// ],
// ),
// ],
// );
// });
// }),
// ],
// ),
// ),
