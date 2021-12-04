import 'package:flutter/material.dart';
import 'package:scanner/constants/constants.dart';
import 'package:scanner/controller/person_controller.dart';
import 'package:get/get.dart';
import 'package:scanner/screens/participantDetails/participant_qrdetails.dart';

class HomePaeContainer extends StatefulWidget {
  HomePaeContainer({
    Key? key,
    required this.size,
    required this.index,
  }) : super(key: key);

  final Size size;
  final int index;

  @override
  State<HomePaeContainer> createState() => _HomePaeContainerState();
}

class _HomePaeContainerState extends State<HomePaeContainer> {
  @override
  PersonController personController = Get.find<PersonController>();

  int _currentIndex = 0;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ParticipantDetails(index: widget.index));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: widget.size.width / 3.6,
        width: widget.size.width / 3.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: CommonPageColors.white,
            boxShadow: [
              BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(.05))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: widget.size.width / (3.6 * 2) - 30,
            ),
            Text(
              personController.userList[widget.index].name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CommonPageColors.textColor,
                fontSize: 13,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              personController.userList[widget.index].college,
              style: TextStyle(
                color: CommonPageColors.textColor,
                decoration: TextDecoration.none,
                fontSize: 10,
              ),
            ),
            const Spacer(),
            Container(
              width: widget.size.width / 3.6 - 50,
              height: 4,
              decoration: BoxDecoration(
                  color: const Color(0xffFF0236),
                  borderRadius: BorderRadius.circular(2)),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
