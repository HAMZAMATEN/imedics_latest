import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imedics_latest/screens/patient_screens/patientModels/user_doc_model.dart';

class DoctorProfileState {
  String slectedDays = '';
  String weekTime = '';

  final cardName = TextEditingController();
  final bank = TextEditingController();
  final branchCode = TextEditingController();
  final cardType = TextEditingController();
  final accountNumber = TextEditingController();
  final expiryYear = TextEditingController();
  final expiryMonth = TextEditingController();
  final cvvCode = TextEditingController();
  final details = TextEditingController();
  final accountTitle = TextEditingController();

  final currentPasCon = TextEditingController();
  final newPassCon = TextEditingController();
  final confirmPasCon = TextEditingController();

  var loading = false.obs;
  var profileLoading = false.obs;
  var changePAssLoading = false.obs;
  var updateProfileLoading = false.obs;
  late UserDocModel docModel;

  ImagePicker imagePicker = ImagePicker();
  XFile? pickedImage;
  var imagePath = ''.obs;

  late TextEditingController emailController;
  // TextEditingController phoneNumberController = TextEditingController();
  late TextEditingController aboutYourselfController;
  late TextEditingController usernameController ;
}
