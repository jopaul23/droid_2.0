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
        breakFast: json["breakfast"] == 0?false:true,
        lunch: json["lunch"] == 0? false:true,
        snack: json["snacks"] as int,
        supper: json["supper"] ==0? false:true);
  }
}
