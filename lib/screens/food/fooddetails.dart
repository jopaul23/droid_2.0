import 'package:flutter/material.dart';
import 'package:scanner/constants/constants.dart';
import 'package:get/get.dart';
import 'package:scanner/screens/certificates.dart/certificates.dart';
import 'package:scanner/screens/home/home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
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
        floatingActionButton: TextButton.icon(
            icon: Icon(Icons.share),
            onPressed: () {},
            label: Text('Export to excel')),
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
                        createTable(),
                      ],
                    )
                  ],
                ))));
  }

  Widget createTable() {
    List<Person> _personList = [];

    for (int i = 0; i < 5; ++i) {
      Person temp = Person(
          id: 1, breakfast: 'true', lunch: 'true', tea: 3, supper: 'true');
      _personList.add(temp);
    }

    return Container(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Table(
        border: TableBorder.all(
            color: Colors.black, borderRadius: BorderRadius.circular(3)),
        children: List<TableRow>.generate(
          _personList.length,
          (index) {
            final person = _personList[index];
            return TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child:
                      Text(person.id.toString(), textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(person.breakfast, textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(person.lunch, textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child:
                      Text(person.tea.toString(), textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(person.supper, textAlign: TextAlign.center),
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

class Person {
  final int id;
  final String breakfast;
  final String lunch;
  final int tea;
  final String supper;

  const Person({
    this.id = 0,
    this.breakfast = '',
    this.lunch = 'dfd',
    this.tea = 0,
    this.supper = '',
  });
}
