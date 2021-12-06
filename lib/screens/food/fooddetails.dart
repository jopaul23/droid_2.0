import 'package:flutter/material.dart';
import 'package:scanner/backend/api.dart';
import 'package:scanner/backend/convert_csv.dart';
import 'package:scanner/constants/constants.dart';
import 'package:get/get.dart';
import 'package:scanner/models/food.dart';
import 'package:scanner/screens/certificates.dart/certificates.dart';
import 'package:scanner/screens/home/home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  late List<Food> _foods;
  bool _loaded = false;
  @override
  void initState() {
    super.initState();
    Api.getAllFoodDetails().then((value) => setState(() {
          _foods = value;
          _loaded = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 2;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: CommonPageColors.white,
          currentIndex: _currentIndex,
          onTap: (newIndex) {
            setState(() {
              _currentIndex = newIndex;
              if (newIndex == 0) {
                Get.to(const Home());
              } else if (newIndex == 1) {
                Get.off(const Certificate());
              } else if (newIndex == 2) {}
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            convert_csv_user_food(_foods);
          },
          child: Icon(Icons.download),
        ),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.only(
                  top: 18,
                  left: 5,
                  right: 3,
                ),
                child: Column(
                  children: [
                    Text(
                      'Food Details',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Table(
                            border: TableBorder.all(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5)),
                            children: const [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30.0,
                                    top: 10,
                                  ),
                                  child: Text(
                                    'ID',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5.0,
                                    top: 10,
                                  ),
                                  child: Text(
                                    'BreakFast',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15.0,
                                    top: 10,
                                  ),
                                  child: Text(
                                    'Lunch',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 25.0,
                                    top: 10,
                                  ),
                                  child: Text(
                                    'Tea',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 10,
                                  ),
                                  child: Text(
                                    'Supper',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                        _loaded ? createTable() : CircularProgressIndicator(),
                      ],
                    )
                  ],
                ))));
  }

  Widget createTable() {
    return Container(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Table(
        border: TableBorder.all(
            color: Colors.black, borderRadius: BorderRadius.circular(3)),
        children: List<TableRow>.generate(
          _foods.length,
          (index) {
            final person = _foods[index];
            return TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child:
                      Text(person.id.toString(), textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(_foods[index].breakFast.toString(),
                      textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(_foods[index].lunch.toString(),
                      textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(_foods[index].snack.toString(),
                      textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(_foods[index].supper.toString(),
                      textAlign: TextAlign.center),
                ),
              ],
            );
          },
          growable: false,
        ),
      ),
    );
  }
}
