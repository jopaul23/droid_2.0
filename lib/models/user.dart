class User {
  final int id;
  final String name;
  final String dept;
  final String college;
  final String mob;

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
