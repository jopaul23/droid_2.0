import 'package:flutter/material.dart';
import 'package:scanner/screens/scanningPage/scanning_page.dart';
import 'package:get/get.dart';

class ScannerLog extends StatefulWidget {
  ScannerLog({Key? key}) : super(key: key);

  @override
  State<ScannerLog> createState() => _ScannerLogState();
}

class _ScannerLogState extends State<ScannerLog> {
  var _site;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Card(
            elevation: 8,
            child: Container(
              width: 300,
              height: 500,
              padding: EdgeInsets.all(18.0),
              child: Card(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    title: const Text('Breakfast'),
                    leading: Radio(
                      value: 'Breakfast',
                      groupValue: _site,
                      onChanged: (var value) {
                        setState(() {
                          _site = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Lunch'),
                    leading: Radio(
                      value: 'Lunch',
                      groupValue: _site,
                      onChanged: (var value) {
                        setState(() {
                          _site = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('tea'),
                    leading: Radio(
                      value: 'snacks',
                      groupValue: _site,
                      onChanged: (var value) {
                        setState(() {
                          _site = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Supper'),
                    leading: Radio(
                      value: 'Supper',
                      groupValue: _site,
                      onChanged: (var value) {
                        setState(() {
                          _site = value;
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.off(QRViewExample(
                          tag: _site,
                        ));
                      },
                      child: const Text("Continue"))
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
