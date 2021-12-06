import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scanner/backend/convert_csv.dart';
import 'package:scanner/constants/constants.dart';
import 'package:scanner/screens/certificates.dart/certificates.dart';
import 'package:scanner/screens/food/fooddetails.dart';
import 'package:scanner/screens/home/top_widget.dart';
import 'package:scanner/controller/person_controller.dart';
import 'package:scanner/screens/scanningPage/scanning_page.dart';
import 'package:scanner/widgets/user_container.dart';

import '../scanningPage/scanning_complete_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PersonController personController = Get.put(PersonController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    personController.getUserList();
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          convert_csv_user(personController.userList);
        },
        child: Icon(Icons.download),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CommonPageColors.white,
        currentIndex: _currentIndex,
        onTap: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
            if (newIndex == 0) {
            } else if (newIndex == 1) {
              Get.to(const Certificate());
            } else if (newIndex == 2) {
              Get.to(const FoodDetails());
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/home.svg",
              color: _currentIndex == 0
                  ? CommonPageColors.primaryBlue
                  : CommonPageColors.textColor,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/certificate.svg",
              color: _currentIndex == 1
                  ? CommonPageColors.primaryBlue
                  : CommonPageColors.textColor,
            ),
            label: "certificate",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/events.svg",
              color: _currentIndex == 2
                  ? CommonPageColors.primaryBlue
                  : CommonPageColors.textColor,
            ),
            label: "events",
          ),
        ],
      ),
      body: Container(
        color: CommonPageColors.bgColor,
        padding:
            const EdgeInsets.only(top: 70, right: 16, left: 16, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopWidget(
              isCertificate: false,
            ),
            Expanded(
              child: GetBuilder<PersonController>(builder: (personController) {
                if (personController.loading)
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                return GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children:
                      List.generate(personController.userList.length, (index) {
                    return Center(
                      child: HomePaeContainer(
                        size: size,
                        isC: false,
                        index: index,
                      ),
                    );
                  }),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
