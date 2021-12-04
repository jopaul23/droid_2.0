import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:scanner/controller/person_controller.dart';

import 'certificate.dart';

class ParticipantDetails extends StatelessWidget {
  ParticipantDetails({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    PersonController personController = Get.find<PersonController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                      Text(personController.userList[index].name),
                      Text(personController.userList[index].dept),
                      Text(personController.userList[index].college)
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
              Container(
                height: 100,
                width: 300,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
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
                          ),
                        ],
                      )),
                ),
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
