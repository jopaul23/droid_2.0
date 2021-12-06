import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:external_path/external_path.dart';
import 'package:permission_handler/permission_handler.dart';
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
  Uint8List? uint8list;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _generateCertificate();
  }

  void _generateCertificate() async {
    final rawbase64 = await Api.getCertificate(widget.user.id);
    setState(() {
      uint8list = base64.decode(rawbase64);
      certificate = Image.memory(
        uint8list!,
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
                onTap: () async {
                  // Download
                  Permission permission = Permission.storage;

                  while (await permission.status.isDenied) {
                    await permission.request();
                    // We didn't ask for permission yet or the permission has been denied before but not permanently.

                  }

                  while (await permission.status.isDenied) {
                    await permission.request();
                    // We didn't ask for permission yet or the permission has been denied before but not permanently.

                  }

// You can can also directly ask the permission about its status.
                  if (await Permission.location.isRestricted) {
                    // The OS restricts access, for example because of parental controls.
                  }

                  String path =
                      await ExternalPath.getExternalStoragePublicDirectory(
                          ExternalPath.DIRECTORY_DOWNLOADS);
                  path = path + "/" + "test" + ".png";

                  File file = File(path);
                  if (!file.existsSync()) file.create(recursive: true);
                  file.writeAsBytes(uint8list!);
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
