import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';

class DropdownExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dropdownController = Get.put(_DropdownController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Example'),
      ),
      body: Center(
        child: Obx(
              () => DropdownButton<String>(
            value: dropdownController.selectedItem.value,
            onChanged: (String? value) {
              if (value != null) {
                dropdownController.setSelectedItem(value);
              }
            },
            items: <String>['Blood Reports', 'MRI', 'CT Scan']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,style: getRegularStyle(color: Colors.black),),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _DropdownController extends GetxController {
  var selectedItem = 'Blood Reports'.obs;

  void setSelectedItem(String value) {
    selectedItem.value = value;
  }
}
