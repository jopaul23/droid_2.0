import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:scanner/scanningPage/scanning_page.dart';
import 'package:scanner/scanningPage/scanning_toast.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 70, right: 16, left: 16, bottom: 10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 30,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.blue),
            child: GestureDetector(
              onTap: () {
                // late OverlayEntry overlayEntry;
                // overlayEntry = OverlayEntry(
                //     builder: (context) => ScannedPopUp(
                //           name: "Jopaul Joy",
                //           overlayEntry: overlayEntry,
                //         ));
                // Overlay.of(context)!.insert(overlayEntry);
                Get.to(const QRViewExample());
              },
              child: Text(
                "add participant",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    decoration: TextDecoration.none),
              ),
            ),
          )
        ],
      ),
    );
  }
}
