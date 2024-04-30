import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showNoInternetDialogueBox(BuildContext context,VoidCallback retryFunction) async{
  showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('No Connection'),
      content: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Icon(Icons.signal_wifi_connected_no_internet_4_sharp,color: Colors.red,size: 56,),
          SizedBox(
            height: 15,
          ),
          const Text('Please check your internet connectivity'),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: retryFunction,
          child: const Text('Retry'),
        ),
      ],
    ),
  );
}
