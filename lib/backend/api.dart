import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scanner/models/food.dart';
import 'package:scanner/models/user.dart';

class Api {
  static const url = "http://10.100.26.7:5000";

  static Future<String> getCertificate(int id) async {
    final urLink = Uri.parse(url + "/getcertificate");
    final response = await http.post(urLink, body: {'id': id});

    return jsonDecode(response.body)["data"];
  }

  static Future<List<User>> getAllUsers() async {
    final urLink = Uri.parse(url + "/getAllUsers");
    final response = await http.post(urLink);

    List<Map> json = jsonDecode(response.body);
    List<User> users = [];
    for (Map j in json) {
      users.add(User.fromJson(j));
    }
    return users;
  }

  static Future<User> getUser(int id) async {
    final urLink = Uri.parse(url + "/getUser");
    final response = await http.post(urLink, body: {'id': id});

    List<Map> json = jsonDecode(response.body);
    User user = User.fromJson(json[0]);

    return user;
  }

  static Future<List<Food>> getAllFoodDetails() async {
    final urLink = Uri.parse(url + "/getAllRefershmentDetails");
    final response = await http.post(urLink);

    List<Map> json = jsonDecode(response.body);
    List<Food> foods = [];
    for (Map j in json) {
      foods.add(Food.fromJson(j));
    }
    return foods;
  }

  static Future<Food> getUserFood(int id) async {
    final urLink = Uri.parse(url + "/getRefershmentDetails");
    final response = await http.post(urLink, body: {"id": id});
    List<Map> json = jsonDecode(response.body);
    Food food = Food.fromJson(json[0]);

    return food;
  }

  static void update(int id, var value, var tag) async {
    final urLink = Uri.parse(url + '/updateRefershment');
    final response =
        await http.post(urLink, body: {'id': id, 'value': value, 'tag': tag});
  }
}