import 'package:flutter/material.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/button.tab-pokemon.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/stat/data/characteristic.data.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/stat/stat.tab-pokemon.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/type.tab-pokemon.dart';

class TabPokemon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.1),
            borderRadius: BorderRadius.circular(60),
          ),
          height: MediaQuery.of(context).size.height / 1.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Image.network(
                  "https://pokeres.bastionbot.org/images/pokemon/2.png",
                ),
              ),
              Text(
                "Bulbizar",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 2)),
              TypeTabPokemon(),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              StatTabPokemon(characteristics: listCaliber),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              StatTabPokemon(characteristics: listPrimaryStats),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              ButtonTabPokemon(),
            ],
          ),
        ),
      ],
    );
  }
}
