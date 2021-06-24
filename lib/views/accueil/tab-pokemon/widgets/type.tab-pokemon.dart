import 'package:flutter/material.dart';

class TypeTabPokemon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: <Widget>[
          Container(
            height: 20,
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: Colors.green,
            ),
            child: Text("Plante"),
          ),
          Container(
            height: 20,
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: Colors.purple,
            ),
            child: Text("Poison"),
          ),
        ],
      ),
    );
  }
}
