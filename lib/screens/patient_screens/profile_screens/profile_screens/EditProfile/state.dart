import 'package:flutter/cupertino.dart';
import 'package:imedics_latest/helpers/app_constants.dart';

class EditProfileState{
      TextEditingController nameController = TextEditingController(text: '${AppConstants.userName}');
      TextEditingController eMailController = TextEditingController(text: '${AppConstants.userEmail}');
}