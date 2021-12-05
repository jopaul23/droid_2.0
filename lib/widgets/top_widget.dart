import 'package:flutter/material.dart';
import 'package:scanner/constants/constants.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scanner/screens/scanningPage/scannerlog.dart';
import 'package:scanner/screens/scanningPage/scanning_page.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    required this.isCertificate,
    Key? key,
  }) : super(key: key);
  final bool isCertificate;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SvgPicture.asset(
                isCertificate
                    ? "assets/svg/certificateImg.svg"
                    : "assets/svg/img.svg",
                height: 200,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Get.to(ScannerLog());
          },
          child: isCertificate
              ? SizedBox()
              : Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: CommonPageColors.primaryBlue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/qr.svg",
                        height: 30,
                        color: CommonPageColors.bgColor,
                      ),
                      Text(
                        "scan",
                        style: TextStyle(
                            fontSize: 16,
                            color: CommonPageColors.bgColor,
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
