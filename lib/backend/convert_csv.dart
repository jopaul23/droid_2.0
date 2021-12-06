import 'dart:io';
import 'package:csv/csv.dart';
import 'package:scanner/models/food.dart';
import 'package:scanner/models/user.dart';
import 'package:external_path/external_path.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String> convert_csv_user(List<User> users) {
  List<List<dynamic>> rows = [];

  List<dynamic> row = ["id", "Name", "Dept", "College", "Event", "Mobile"];
  rows.add(row);
  for (int i = 0; i < users.length; i++) {
    List row = [];
    row.add(users[i].id);
    row.add(users[i].name);
    row.add(users[i].dept);
    row.add(users[i].college);
    row.add(users[i].event);

    row.add(users[i].mob);

    rows.add(row);
  }

  return convert(rows);
}

Future<String> convert_csv_user_food(List<Food> foods) async {
  List<List<dynamic>> rows = [];

  List<dynamic> row = [
    "id",
    "BreakFast",
    "Lunch",
    "Snack",
    "Supper",
  ];
  rows.add(row);
  for (int i = 0; i < foods.length; i++) {
    List row = [];
    row.add(foods[i].id);
    row.add(foods[i].breakFast);
    row.add(foods[i].lunch);
    row.add(foods[i].snack);
    row.add(foods[i].supper);

    rows.add(row);
  }

  return await convert(rows);
}

Future<String> convert(List<List<dynamic>> rows) async {
  String csv = ListToCsvConverter().convert(rows);

  Permission permission = Permission.storage;

  while (await permission.status.isDenied) {
    await permission.request();
    // We didn't ask for permission yet or the permission has been denied before but not permanently.

  }

// You can can also directly ask the permission about its status.
  if (await Permission.location.isRestricted) {
    // The OS restricts access, for example because of parental controls.
  }

  String path = await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_DOWNLOADS);
  path = path + "/" + "test" + ".csv";

  File file = File(path);
  if (!file.existsSync()) file.create(recursive: true);
  file.writeAsString(csv);
  return path;
}
