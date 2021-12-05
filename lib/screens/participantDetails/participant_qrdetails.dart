import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:scanner/backend/api.dart';
import 'package:scanner/constants/constants.dart';
import 'package:scanner/controller/person_controller.dart';
import 'package:scanner/models/food.dart';
import 'package:scanner/models/user.dart';
import 'package:scanner/screens/certificates.dart/certificate_preview.dart';
import 'package:scanner/screens/certificates.dart/certificates.dart';
import 'package:scanner/screens/participantDetails/event_container.dart';

import 'certificate.dart';

class ParticipantDetails extends StatefulWidget {
  ParticipantDetails({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<ParticipantDetails> createState() => _ParticipantDetailsState();
}

class _ParticipantDetailsState extends State<ParticipantDetails> {
  Food? _food;
  @override
  void initState() {
    super.initState();

    Api.getUserFood(widget.user.id).then((value) => setState(() {
          _food = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: CommonPageColors.bgColor,
          padding: EdgeInsets.all(18),
          child: _food == null
              ? CircularProgressIndicator()
              : Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        // height: 500,
                        width: double.infinity,
                        child: Column(
                          children: [
                            const Text(
                              "Details of participant",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Image.asset("assets/png/jopiqrcode.png",
                                height: 200),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(widget.user.name),
                            Text(widget.user.dept),
                            Text(widget.user.college)
                          ],
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "tasks",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    EventContainer(
                      title: "breakfast",
                      condition: _food!.breakFast,
                      isSnack: false,
                    ),
                    EventContainer(
                      title: "lunch",
                      condition: _food!.lunch,
                      isSnack: false,
                    ),
                    EventContainer(
                      title: "dinner",
                      condition: _food!.supper,
                      isSnack: false,
                    ),
                    EventContainer(
                      title: "snack",
                      condition: _food!.snack > 3,
                      isSnack: true,
                      count: _food!.snack,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: CommonPageColors.primaryBlue,
                      ),
                      child: InkWell(
                          onTap: () {
                            Get.to(CerficatePreview(
                               user: widget.user,
                            ));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Certificate Generator",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: CommonPageColors.white),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {

      //   },
      //   tooltip: 'Certificate Generator',
      //   child: const Icon(Icons.arrow_upward),
      // ),
    );
  }

  Future<void> showButtomSheet(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return CertificateWidget();
        });
  }
}
