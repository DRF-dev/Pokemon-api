import 'package:flutter/material.dart';

class TypeTabPokemon extends StatelessWidget {
  List types;
  TypeTabPokemon({required this.types});

  Color getColorByType(String type) {
    switch (type) {
      case "Normal":
        return Color.fromRGBO(146, 154, 163, 1);
      case "Fighting":
        return Color.fromRGBO(143, 36, 37, 1);
      case "Bug":
        return Color.fromRGBO(146, 193, 42, 1);
      case "Grass":
        return Color.fromRGBO(99, 188, 89, 1);
      case "Water":
        return Color.fromRGBO(79, 145, 215, 1);
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: types
            .map(
              (e) => Container(
                height: 20,
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: getColorByType(e),
                ),
                child: Text(e),
              ),
            )
            .toList(),
      ),
    );
  }
}
