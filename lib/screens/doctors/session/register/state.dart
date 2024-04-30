import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndividualDoctorRegistrationState {

  RxInt selectdpage = 0.obs;
  File? imagePath;
  String sletedDate = '';

  final registerIndividualDoctorEmailCon = TextEditingController();
  final registerIndividualDoctorPasswordCon = TextEditingController();
  final registerIndividualDoctorTitleCon = TextEditingController();
  final registerIndividualDoctorFullNameCon = TextEditingController();
  final registerIndividualDoctorDateOfBirthCon = TextEditingController();
  final registerIndividualDoctorPhoneNumberCon = TextEditingController();
  final registerIndividualDoctorSpecializationCon = TextEditingController();
  final registerIndividualDoctorCondionTretmentCon = TextEditingController();
  final registerIndividualDoctorAboutYourselfCon = TextEditingController();
  final registerIndividualDoctorEducationCon = TextEditingController();
  final registerIndividualDoctorCollageCon = TextEditingController();
  final registerIndividualDoctorLicene_numberCon = TextEditingController();
  final registerIndividualDoctorYears_of_experianceCon =
  TextEditingController();
  final registerIndividualDoctorOnce_dateCon = TextEditingController();
  final registerIndividualDoctorOnce_time_formCon = TextEditingController();
  final registerIndividualDoctorOnce_time_tillCon = TextEditingController();
  final registerIndividualDoctorOnce_consultation_freeCon =
  TextEditingController();
  final registerIndividualDoctorDaily_dateTileCon = TextEditingController();
  final registerIndividualDoctorDaily_dateFromCon = TextEditingController();
  final registerIndividualDoctorDaily_time_formCon = TextEditingController();
  final registerIndividualDoctorDaily_time_tillCon = TextEditingController();
  final registerIndividualDoctorDaily_consultation_freeCon =
  TextEditingController();
  final registerIndividualDoctorWeekly_dateCon = TextEditingController();
  final registerIndividualDoctorWeekly_time_formCon = TextEditingController();
  final registerIndividualDoctorWeekly_time_tillCon = TextEditingController();
  final registerIndividualDoctorWeeklyConsultationFreeCon =
  TextEditingController();
}