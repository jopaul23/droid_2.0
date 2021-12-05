import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scanner/backend/api.dart';
import 'package:scanner/constants/constants.dart';
import 'package:scanner/models/user.dart';

class CerficatePreview extends StatefulWidget {
  final User user;
  const CerficatePreview({Key? key, required this.user}) : super(key: key);

  @override
  State<CerficatePreview> createState() => _CerficatePreviewState();
}

class _CerficatePreviewState extends State<CerficatePreview> {
  Image? certificate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _generateCertificate();
  }

  void _generateCertificate() async {
    final rawbase64 = await Api.getCertificate(widget.user.id);
    setState(() {
      certificate = Image.memory(
        base64.decode(rawbase64),
        width: MediaQuery.of(context).size.width - defaultPadding * 2,
      );
    });
  }

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
              certificate != null
                  ? certificate!
                  : const CircularProgressIndicator(),
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
