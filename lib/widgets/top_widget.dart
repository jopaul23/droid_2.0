import 'package:flutter/material.dart';
import 'package:scanner/constants/constants.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scanner/screens/scanningPage/scannerlog.dart';
import 'package:scanner/screens/scanningPage/scanning_page.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    required this.id,
    Key? key,
  }) : super(key: key);
  final int id;
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
                id == 1
                    ? "assets/svg/certificateImg.svg"
                    : id == 0
                        ? "assets/svg/img.svg"
                        : "assets/svg/food.svg",
                height: 200,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Get.to(ScannerLog());
          },
          child: id == 1
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
