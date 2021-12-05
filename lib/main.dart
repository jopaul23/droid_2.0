import 'package:flutter/material.dart';
import 'package:scanner/screens/food/fooddetails.dart';
import 'package:scanner/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scanner/screens/participantDetails/participant_qrdetails.dart';

import 'screens/scanningPage/scannerlog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () {
          return GetMaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              fontFamily: GoogleFonts.rubik(fontSize: 14.sp).fontFamily,
              primarySwatch: Colors.blue,
            ),
            home: ScannerLog(),
            //const FoodDetails(),
            //ParticipantDetails(),
          );
        });
  }
}
