import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage2 extends StatelessWidget {
  const CallPage2({Key? key,}) : super(key: key);
  // final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 692080953, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: "6b5f74cc7a4b660e5674d668aca949a6287ad3358f13c52a58083e76fce5fff5", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: '12312',
      userName: 'Hamza',
      callID: "11223344",
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(

      ),
    );
  }
}