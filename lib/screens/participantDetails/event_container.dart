import 'package:flutter/material.dart';
import 'package:scanner/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventContainer extends StatelessWidget {
  const EventContainer({
    Key? key,
    required this.title,
    required this.condition,
    this.count,
    required this.isSnack,
  }) : super(key: key);
  final String title;
  final bool condition;
  final bool isSnack;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width - 16 * 2,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: CommonPageColors.textColor,
              ),
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              SvgPicture.asset(
                condition
                    ? "assets/svg/checkBoxOn.svg"
                    : "assets/svg/checkBox.svg",
                height: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(color: CommonPageColors.textColor),
              ),
              const Spacer(),
              isSnack ? Text("${count}/3") : SizedBox()
            ],
          ),
        ),
        Row(
          children: [
            const SizedBox(
              width: defaultPadding,
            ),
            Container(
              height: condition ? 1 : 0,
              width: 100,
              color: Colors.black,
            ),
          ],
        )
      ],
    );
  }
}
