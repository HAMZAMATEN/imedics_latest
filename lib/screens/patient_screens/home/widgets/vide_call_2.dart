import 'package:flutter/material.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage2 extends StatelessWidget {
  const CallPage2({Key? key,}) : super(key: key);
  // final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: AppConstants.appID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: AppConstants.appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: '12312',
      userName: 'Hamza',
      callID: "11223344",
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(

      ),
    );
  }
}