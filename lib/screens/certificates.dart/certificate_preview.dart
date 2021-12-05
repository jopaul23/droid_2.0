import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scanner/constants/constants.dart';

class CerficatePreview extends StatelessWidget {
  const CerficatePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonPageColors.bgColor,
        body: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Certificate",
                    style: TextStyle(
                      color: CommonPageColors.textColor,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/svg/exit.svg",
                    height: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Image.asset(
                "assets/png/certificate.png",
                width: MediaQuery.of(context).size.width - defaultPadding * 2,
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  // Download
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: CommonPageColors.primaryBlue),
                  child: const Text(
                    "download",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
