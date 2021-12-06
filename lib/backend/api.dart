import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:scanner/models/food.dart';
import 'package:scanner/models/user.dart';

class Api {
  static const url = "http://10.100.26.7:5000";

  static Future<String> getCertificate(int id) async {
    final urLink = Uri.parse(url + "/getcertificate");
    final response = await http.post(urLink, body: {'id': id.toString()});

    String a = response.body;
    print(a);
    return a;
  }

  static Future<List<User>> getAllUsers() async {
    final urLink = Uri.parse(url + "/getAllUsers");
    final response = await http.post(urLink);

    List json = jsonDecode(response.body);
    List<User> users = [];
    for (var j in json) {
      users.add(User.fromJson(j));
    }
    return users;
  }

  static Future<User> getUser(int id) async {
    final urLink = Uri.parse(url + "/getUser");
    final response = await http.post(urLink, body: {'id': id.toString()});

    List json = jsonDecode(response.body);
    User user = User.fromJson(json[0]);
    print("---------------------------");
    print(user.name);
    return user;
  }

  static Future<List<Food>> getAllFoodDetails() async {
    final urLink = Uri.parse(url + "/getAllRefershmentDetails");
    final response = await http.post(urLink);

    List json = jsonDecode(response.body);
    List<Food> foods = [];
    for (var j in json) {
      foods.add(Food.fromJson(j));
    }
    return foods;
  }

  static Future<Food> getUserFood(int id) async {
    final urLink = Uri.parse(url + "/getRefershmentDetails");
    final response = await http.post(urLink, body: {"id": id.toString()});
    List json = jsonDecode(response.body);
    Food food = Food.fromJson(json[0]);

    return food;
  }

  static void update(int id, var value, var tag) async {
    try {
      final urLink = Uri.parse(url + '/updateRefershment');
      print(tag);
      final response = await http.post(urLink, body: {
        'id': id.toString(),
        'value': value.toString(),
        'tag': tag.toLowerCase()
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
