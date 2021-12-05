import 'package:flutter/material.dart';
import 'package:scanner/backend/api.dart';

class CertificateWidget extends StatefulWidget {
  const CertificateWidget({Key? key}) : super(key: key);

  @override
  _CertificateWidgetState createState() => _CertificateWidgetState();
}

class _CertificateWidgetState extends State<CertificateWidget> {
  @override
  void initState() {
    super.initState();
    //Api.getCertificate(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      color: Colors.white24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("CERTIFICATE"),
          SizedBox(height: 20),
          Container(
            height: 300,
            width: double.maxFinite,
            child: Image.asset("assets/png/certificate.png"),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.download),
                  ),
                  Text('Download'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    iconSize: 30,
                    onPressed: () {
                      
                    },
                    icon: Image.asset(
                      "assets/png/preview.png",
                    ),
                  ),
                  Text('Preview'),
                ],
              ),
              Column(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                  Text('Share'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
