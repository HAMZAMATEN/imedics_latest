import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as m;
import 'package:http/http.dart' as http;

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:imedics_latest/components/snack_bar_widget.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  void initFirebase() async {
    FirebaseMessaging.onMessage.listen((message) {


      if(Platform.isIOS){
        foregroundMessage();
      }


      if (Platform.isAndroid) {
        initNotifications(message);
        showNotifications(message);
      }
    });
  }

  void initNotifications(RemoteMessage message) async {
    var androidInitSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSInitSettings = DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iOSInitSettings,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) {
          handleNotification(message);
        });
  }

  void showNotifications(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        m.Random.secure().nextInt(100000).toString(), 'My first notification',
        importance: Importance.max);
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: 'The channel description is here',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );
    DarwinNotificationDetails darwinNotificationDetails =
    DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentBanner: true,
      presentList: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
          1,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }


  setupBackgrounInteractMsg() async {
    RemoteMessage? msg = await FirebaseMessaging.instance.getInitialMessage();
    if(msg != null) {
      handleNotification(msg);
    }
    await FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleNotification(event);
    });
  }


  void requestPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      sound: true,
      badge: true,
      provisional: true,
      alert: true,
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('Permission granted');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('Provisional Permission granted');
    } else {
      AppSettings.openAppSettings(
        type: AppSettingsType.notification,
      );
      log('denied');
    }
  }

  Future<String> getToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void refreshToken() {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      log('event');
    });
  }

  void handleNotification(RemoteMessage message) async {
    if (message.data['type'] == 'chat') {
      log('id:'+message.data['id']);
      // Navigator.push(
      //   context,
      //   // MaterialPageRoute(
      //   //   builder: (context) => MessageScreen(
      //   //     id: message.data['id'],
      //   //   ),
      //   // ),
      // );
    }else{
      log('something  went wrong');
    }
  }

  Future foregroundMessage() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }


  sendNotification(String title , String Notificbody,String token,String snackbarMsg)async{
    // var token = await fetchPushToken(userId);
    print('token:${token}');
    var data = {
      'to': token,
      'priority' :'high',
      'notification': {
        'title': title,
        'body': Notificbody
      },

    };
    log('data:$data');
    await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'key=AAAADcOK1jQ:APA91bFo7zmo4Y2paqWELQjg5FKoT8fs_Q3vtIuy8-gZyPd9MNGakCb3a3mbtLFtD-5afFYAvnujpDw_QNtlCLA9x4uPGUYKJuVbbPjHuBha-gy6J21rn7b-WBpta1T3EqnzV-b7GFij'
        }
    ).then((value){
      Snackbar.showSnackBar( '${snackbarMsg}.', Icons.send);
    }).onError((error, stackTrace){
      print('error'+error.toString());
    });
  }


}
