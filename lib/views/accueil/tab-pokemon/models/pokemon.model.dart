class PokemonModel {
  final String name;
  final List types;
  final int hp;
  final int attack;
  final int defence;
  final int attacksp;
  final int defencesp;
  final int speed;
  final String heigth;
  final String weigth;
  final String imgUrl;
  PokemonModel({
    required this.name,
    required this.types,
    required this.hp,
    required this.attack,
    required this.defence,
    required this.attacksp,
    required this.defencesp,
    required this.speed,
    required this.heigth,
    required this.weigth,
    required this.imgUrl,
  });
  PokemonModel.fromJson(Map<String, dynamic> json)
      : name = json["name"]["french"],
        types = json["type"],
        hp = json["base"]?["HP"] ?? 0,
        attack = json["base"]?["Attack"] ?? 0,
        defence = json["base"]?["Defense"] ?? 0,
        attacksp = json["base"]?["Sp. Attack"] ?? 0,
        defencesp = json["base"]?["Sp. Defense"] ?? 0,
        speed = json["base"]?["Speed"] ?? 0,
        heigth = json["profile"]["height"],
        weigth = json["profile"]["weight"],
        imgUrl = json["hires"];
}
