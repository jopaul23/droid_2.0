import 'package:flutter/material.dart';
import 'package:scanner/widgets/top_widget.dart';

class FoodDetails1 extends StatefulWidget {
  const FoodDetails1({Key? key}) : super(key: key);

  @override
  _FoodDetails1State createState() => _FoodDetails1State();
}

class _FoodDetails1State extends State<FoodDetails1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [TopWidget(id: 2)],
        ),
      ),
    );
  }
}
