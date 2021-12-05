import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scanner/models/food.dart';
import 'package:scanner/models/user.dart';

class PersonController extends GetxController {
  List<User> userList = [
    User(
        id: 1,
        name: "Joyal Raphel",
        dept: "Computer Science",
        college: "FISAT",
        mob: 84373737233),
    User(
        id: 1,
        name: "Naigesh K",
        dept: "Computer Science",
        college: "Rajagiri",
        mob: 84373737233),
    User(
        id: 1,
        name: "Joyal Raphel",
        dept: "Computer Science",
        college: "FISAT",
        mob: 84373737233),
    User(
        id: 1,
        name: "Joyal Raphel",
        dept: "Computer Science",
        college: "FISAT",
        mob: 84373737233),
    User(
        id: 1,
        name: "Joyal Raphel",
        dept: "Computer Science",
        college: "FISAT",
        mob: 84373737233)
  ];

  List<Food> foodList = [
    Food(id: 1, breakFast: false, lunch: true, snack: 2, supper: true),
    Food(id: 1, breakFast: false, lunch: true, snack: 2, supper: true),
    Food(id: 1, breakFast: false, lunch: true, snack: 2, supper: true),
    Food(id: 1, breakFast: false, lunch: true, snack: 2, supper: true),
    Food(id: 1, breakFast: false, lunch: true, snack: 2, supper: true)
  ];
}
