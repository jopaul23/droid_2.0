import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:scanner/constants/constants.dart';
import 'package:scanner/controller/person_controller.dart';
import 'package:scanner/models/food.dart';
import 'package:scanner/models/user.dart';
import 'package:scanner/screens/participantDetails/event_container.dart';

import 'certificate.dart';

class ParticipantDetails extends StatelessWidget {
  ParticipantDetails({Key? key, required this.user, required this.food})
      : super(key: key);
  final User user;
  final Food food;
  @override
  Widget build(BuildContext context) {
    PersonController personController = Get.find<PersonController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: CommonPageColors.bgColor,
          padding: EdgeInsets.all(18),
          child: Column(
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
                      Image.asset("assets/png/jopiqrcode.png", height: 200),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(user.name),
                      Text(user.dept),
                      Text(user.college)
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
              const EventContainer(
                title: "breakfast",
                condition: true,
                isSnack: false,
              ),
              const EventContainer(
                title: "lunch",
                condition: true,
                isSnack: false,
              ),
              const EventContainer(
                title: "dinner",
                condition: true,
                isSnack: false,
              ),
              const EventContainer(
                title: "snack",
                condition: false,
                isSnack: true,
                count: 2,
              ),
              SizedBox(
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
                      showButtomSheet(context);
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
