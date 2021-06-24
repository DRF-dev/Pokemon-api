import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/views/accueil/tab-pokemon/models/pokemon.model.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/stat/models/characteristic.model.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/stat/stat.tab-pokemon.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/type.tab-pokemon.dart';

class TabPokemon extends StatefulWidget {
  @override
  _TabPokemonState createState() => _TabPokemonState();
}

class _TabPokemonState extends State<TabPokemon> {
  PokemonModel? pokemonModel;
  bool isLoading = true;

  @override
  void initState() {
    getPokemons();
    super.initState();
  }

  getPokemons() async {
    Uri uri = Uri.parse("https://app.pokemon-api.xyz/pokemon/random");
    http.Response res = await http.get(uri);
    Map<String, dynamic> body = jsonDecode(res.body);
    pokemonModel = PokemonModel.fromJson(body);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator();
    }
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.1),
            borderRadius: BorderRadius.circular(60),
          ),
          height: MediaQuery.of(context).size.height / 1.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Image.network(pokemonModel!.imgUrl),
              ),
              Text(
                pokemonModel!.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 2)),
              TypeTabPokemon(types: pokemonModel!.types),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              StatTabPokemon(characteristics: [
                Characteristic(
                  characteristic: "Heigth",
                  value: pokemonModel!.heigth,
                ),
                Characteristic(
                  characteristic: "Weigth",
                  value: pokemonModel!.weigth,
                ),
                Characteristic(
                  characteristic: "HP",
                  value: pokemonModel!.hp.toString(),
                ),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              StatTabPokemon(characteristics: [
                Characteristic(
                  characteristic: "Attaque",
                  value: pokemonModel!.attack.toString(),
                ),
                Characteristic(
                  characteristic: "Défense",
                  value: pokemonModel!.defence.toString(),
                ),
                Characteristic(
                  characteristic: "Vitesse",
                  value: pokemonModel!.speed.toString(),
                ),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              StatTabPokemon(characteristics: [
                Characteristic(
                  characteristic: "Attaque spé",
                  value: pokemonModel!.attacksp.toString(),
                ),
                Characteristic(
                  characteristic: "Défence spé",
                  value: pokemonModel!.defencesp.toString(),
                ),
              ]),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            ],
          ),
        ),
      ],
    );
  }
}
