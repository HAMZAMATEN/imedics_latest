import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/screens/patient_screens/report_screens/state.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class ReportViewController extends GetxController {
  final state = ReportViewState();

  final picker = ImagePicker();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  XFile? _image;

  XFile? get image => _image;

  Future pickedImageFromGallery(BuildContext context) async {
    final pickedImage =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

    if (pickedImage != null) {
      _image = XFile(pickedImage.path);
      // uploadImage(context);
      update();
    }
  }

  //
  Future pickedImageFromCamera(BuildContext context) async {
    final pickedImage =
    await picker.pickImage(source: ImageSource.camera, imageQuality: 25);

    if (pickedImage != null) {
      _image = XFile(pickedImage.path);
      // uploadImage(context);
      update();
    }
  }

  void showImage(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 250.h,
            child: Padding(
              padding:  EdgeInsets.all(15.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text("Select only single Image",style: getSemiBoldStyle(color: AppColors.appColor,fontSize: MyFonts.size22),),
                  ),
                  padding4,
                  Divider(color: Colors.black,),
                  padding4,
                  ListTile(
                    onTap: () {
                      // print('inside');
                      pickedImageFromCamera(context);
                      // print('insideqw21');

                      Navigator.pop(context);
                    },
                    leading: Icon(Icons.camera),
                    title: Text('Camera'),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 30.w),
                    child: Divider(color: Colors.black54,),
                  ),
                  ListTile(
                    onTap: () {
                      pickedImageFromGallery(context);
                      Navigator.pop(context);
                    },
                    leading: Icon(Icons.image),
                    title: Text('Gallery'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  setUploadLoading(bool val){
    state.imageUploadLoading.value = val;
  }

  Future uploadImage(BuildContext context) async {
    String catogery = state.dorpDownValue.value;
    setUploadLoading(true);
    // showProgressIndicator(context);
    try {
      firebase_storage.Reference storageRef = firebase_storage
          .FirebaseStorage.instance
          .ref('/reports' + DateTime.now().toString());
      firebase_storage.UploadTask uploadTask =
      storageRef.putFile(File(image!.path).absolute);

      await Future.value(uploadTask);
      // log('uploaded');

      state.reportUrl.value = await storageRef.getDownloadURL();
      // log('url:' + state.reportUrl.value);
      FirebaseFirestore.instance
          .collection('users')
          .doc("${AppConstants.userId}")
          .update({
        '${catogery}': FieldValue.arrayUnion([state.reportUrl.toString()]),
        
      }).then((value) {
        // log('then');
        Snackbar.showSnackBar(
             'Report shared sccessfully', Icons.update);
        _image = null;
        update();
        state.dorpDownValue.value="Select";
        setUploadLoading(false);
      }).onError((error, stackTrace) {
        _image = null;
        update();
        state.dorpDownValue.value="Select";
        Snackbar.showSnackBar(
            "Something went wrong", Icons.error_outline);
        setUploadLoading(false);
        // setLoading(false);

        // Navigator.pop(context);
      });
    } catch (e) {
      _image = null;
      update();
      state.dorpDownValue.value="Select";
      setUploadLoading(false);
      // log('error:$e');
      // setLoading(false);

      // Navigator.pop(context);
    }
  }


}