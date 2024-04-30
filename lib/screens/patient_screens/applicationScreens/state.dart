 import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserApplicationViewState {
   RxInt index = 0.obs;


   List<Widget> screens = [
     Container(child: Center(child: Text('0')),color: Colors.grey,),
     Container(child: Center(child: Text('1')),color: Colors.green,),
     Container(child: Center(child: Text('2')),color: Colors.red,),
     Container(child: Center(child: Text('3')),color: Colors.blue,),
     Container(child: Center(child: Text('4')),color: Colors.pink,),
   ];

 }