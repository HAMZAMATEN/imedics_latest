import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetAppointementDetailsState {

  RxString docId = "".obs;
  RxString docName = "".obs;

  RxString year = '2024'.obs;
  RxString month = '04'.obs;
  RxString date = '01'.obs;
  RxString time = '09:00 AM'.obs;
  RxString weekDay = "Monday".obs;
  RxString monthName = "April".obs;

  RxString bookingFor = "Self".obs;
  RxString gender = "Male".obs;
  RxString age = "20".obs;
  TextEditingController detailsController = TextEditingController();


  RxBool Am9 = false.obs;
  RxBool Am10 = false.obs;
  RxBool Am11 = false.obs;
  RxBool Am12 = false.obs;
  RxBool pm01 = false.obs;
  RxBool pm02 = false.obs;
  RxBool pm03 = false.obs;
  RxBool pm04 = false.obs;

  TextEditingController accTitleCont = TextEditingController();
  TextEditingController cardNumCont = TextEditingController();
  TextEditingController yearCont = TextEditingController();
  TextEditingController monthCont = TextEditingController();
  TextEditingController cvvCont = TextEditingController();


}