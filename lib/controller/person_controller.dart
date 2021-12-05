import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scanner/backend/api.dart';
import 'package:scanner/models/food.dart';
import 'package:scanner/models/user.dart';

class PersonController extends GetxController {
  late List<User> userList;
  bool loading = true;
  Future<void> getUserList() async {

    userList = await Api.getAllUsers();
    loading = false;
    update();
  }

  List<Food> foodList = [
    Food(id: 1, breakFast: false, lunch: true, snack: 2, supper: true),
    Food(id: 1, breakFast: false, lunch: true, snack: 2, supper: true),
    Food(id: 1, breakFast: false, lunch: true, snack: 2, supper: true),
    Food(id: 1, breakFast: false, lunch: true, snack: 2, supper: true),
    Food(id: 1, breakFast: false, lunch: true, snack: 2, supper: true)
  ];
}
