import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'certificate.dart';

class ParticipantDetails extends StatelessWidget {
  ParticipantDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 500,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Details of participant",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.asset("assets/png/jopiqrcode.png",
                          height: 150, width: 150),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Jopaul Joy'),
                      Text('CSE B'),
                      Text('Fisat')
                    ],
                  )),
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
