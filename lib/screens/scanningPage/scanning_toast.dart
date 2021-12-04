import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannedPopUp extends StatefulWidget {
  const ScannedPopUp({Key? key, required this.name, required this.overlayEntry})
      : super(key: key);
  final String name;
  final OverlayEntry overlayEntry;
  @override
  _ScannedPopUpState createState() => _ScannedPopUpState();
}

class _ScannedPopUpState extends State<ScannedPopUp>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> mainContainerAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    animation = Tween<double>(begin: 1, end: 0).animate(animationController);
    mainContainerAnimation =
        Tween<double>(begin: 1, end: 0).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
    Future.delayed(Duration(seconds: 9)).whenComplete(() => animationController
        .forward()
        .whenComplete(() => widget.overlayEntry.remove()));
  }

  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Colors.blue.withOpacity(mainContainerAnimation.value),
      child: Column(
        children: [
          const Spacer(),
          FadeTransition(
            opacity: animation,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 100,
                width: MediaQuery.of(context).size.width - 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'user found',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                              decoration: TextDecoration.none),
                        ),
                        SvgPicture.asset(
                          "assets/svg/arrow.svg",
                          color: Colors.grey,
                          height: 30,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'add the participant  ',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          '${widget.name}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 70)
        ],
      ),
    );
  }
}
