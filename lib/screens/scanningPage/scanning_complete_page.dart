import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scanner/backend/api.dart';
import 'package:scanner/constants/constants.dart';
import 'package:scanner/models/user.dart';
import 'package:scanner/screens/home/home.dart';
import 'package:get/get.dart';
import 'package:scanner/screens/scanningPage/scanning_page.dart';

class ScanningCompletePage extends StatefulWidget {
  final int id;
  final String tag;
  const ScanningCompletePage({Key? key, required this.id, required this.tag})
      : super(key: key);

  @override
  _ScanningCompletePageState createState() => _ScanningCompletePageState();
}

class _ScanningCompletePageState extends State<ScanningCompletePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation sizeAnimation1;
  late Animation sizeAnimation2;
  late Animation sizeAnimation3;
  late User user;
  bool _loading = true;
  late Animation opacityAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
    Api.getUser(widget.id).then((value) => setState(() {
          user = value;
          _loading = false;
          animationController.forward();
        }));
    Api.update(widget.id, true, widget.tag);
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    animationController.repeat();
    sizeAnimation1 =
        Tween<double>(begin: 10, end: 35).animate(animationController);
    opacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    sizeAnimation2 =
        Tween<double>(begin: 10, end: 45).animate(animationController);
    sizeAnimation3 =
        Tween<double>(begin: 10, end: 60).animate(animationController);
    animationController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (mounted) animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: _loading
            ? Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              )
            : Stack(
                // fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  _bgCircle(sizeAnimation1.value, size),
                  _bgCircle(sizeAnimation2.value, size),
                  _bgCircle(sizeAnimation3.value, size),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height / 2 - 150,
                      ),
                      Container(
                        height: 300,
                        width: 300,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: CommonPageColors.primaryBlue,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("User found",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w600,
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white),
                              child: const Text(
                                "N",
                                style: TextStyle(
                                    color: Color(0xffFF076A),
                                    fontSize: 40,
                                    decoration: TextDecoration.none),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(user.name,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    decoration: TextDecoration.none)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text("${user.dept}",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    decoration: TextDecoration.none)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(user.college,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    decoration: TextDecoration.none)),
                            const SizedBox(
                              height: 16,
                            ),
                            SvgPicture.asset(
                              "assets/svg/droid.svg",
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.off(Home());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: CommonPageColors.primaryBlue),
                              child: const Text(
                                "back home",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    decoration: TextDecoration.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: CommonPageColors.primaryBlue),
                              child: const Text(
                                "scan new",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    decoration: TextDecoration.none),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  _bgCircle(double radius, Size size) {
    return OverflowBox(
      maxWidth: size.height * 2,
      maxHeight: size.height * 2,
      child: Container(
        height: radius * radius,
        width: radius * radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CommonPageColors.primaryBlue
              .withOpacity(.15 * opacityAnimation.value),
        ),
      ),
    );
  }
}
