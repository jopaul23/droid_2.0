import 'package:flutter/material.dart';
import 'package:scanner/screens/certificates.dart/certificate_preview.dart';
import 'package:scanner/screens/home/home.dart';
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
              fontFamily: GoogleFonts.rubik(fontSize: 14.sp).fontFamily,
              primarySwatch: Colors.blue,
            ),
            home: const Home(),
          );
        });
  }
}
