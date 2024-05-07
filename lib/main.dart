import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/firebase_options.dart';
import 'package:imedics_latest/helpers/app_constants.dart';
import 'package:imedics_latest/helpers/app_theme.dart';
import 'package:imedics_latest/helpers/notification_services.dart';
import 'package:imedics_latest/screens/common/splash/view.dart';
import 'package:zego_zimkit/zego_zimkit.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ZIMKit().init(
    appID: AppConstants.appID, // your appid
    appSign: AppConstants.appSign, // your appSign
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey = 'pk_test_51Ogo46EwduwUAGBRz8KlKG0uKlP2DL1KfBVj3Iqum4fSQVtOfD4WPCisOOmVfIoEAKsBJNTI0WzOmpOLmntqPTTJ00F599LcQW';
  await dotenv.load(fileName: "assets/keyFile/keys.env");
  NotificationServices().requestPermissions();
  NotificationServices().setupBackgrounInteractMsg();
  NotificationServices().foregroundMessage();
  NotificationServices().initFirebase();
  NotificationServices().getToken().then((value) {
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppConstants.stripe_publish_key = dotenv.env['STRIPE_PUBLISH_KEY']!;
    AppConstants.stripe_secret_key = dotenv.env['STRIPE_SECRET_KEY']!;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
        designSize: Size(size.width, size.height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Imedifix Service',
            theme: lightThemeData(context),
            themeMode: ThemeMode.light,
            home: const SplashScreen(),

          );
        });
  }
}
