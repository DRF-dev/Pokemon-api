import 'package:flutter/material.dart';

import 'models/characteristic.model.dart';

class StatTabPokemon extends StatelessWidget {
  final List<Characteristic> characteristics;
  StatTabPokemon({required this.characteristics});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: characteristics.map((characteristic) {
          return Column(
            children: <Widget>[
              Text(
                characteristic.characteristic,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                characteristic.value,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}
