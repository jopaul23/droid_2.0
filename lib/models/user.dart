class User {
  final int id;
  final String name;
  final String dept;
  final String college;
  final int mob;

  User({
    required this.id,
    required this.name,
    required this.dept,
    required this.college,
    required this.mob,
  });

  factory User.fromJson(Map json) {
    return User(
        id: json["id"],
        name: json["name"],
        dept: json["dept"],
        college: json["college"],
        mob: json["mobile"]);
  }
}

class Food {
  final int id;
  final bool breakFast;
  final bool lunch;
  final int snack;
  final bool supper;

  Food({
    required this.id,
    required this.breakFast,
    required this.lunch,
    required this.snack,
    required this.supper,
  });
  factory Food.fromJson(Map json) {
    return Food(
        id: json["id"],
        breakFast: json["breakfast"],
        lunch: json["lunch"],
        snack: json["snack"],
        supper: json["supper"]);
  }
}
