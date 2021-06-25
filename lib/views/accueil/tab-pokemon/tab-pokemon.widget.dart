import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/views/accueil/tab-pokemon/models/pokemon.model.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/single-pokemon.tab-pokemon.dart';

class TabPokemon extends StatefulWidget {
  @override
  _TabPokemonState createState() => _TabPokemonState();
}

class _TabPokemonState extends State<TabPokemon>
    with AutomaticKeepAliveClientMixin<TabPokemon> {
  List<PokemonModel> pokemonModel = [];
  bool isLoading = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    getPokemons();
    super.initState();
  }

  getPokemons() async {
    Uri uri = Uri.parse("https://app.pokemon-api.xyz/pokemon/all");
    http.Response res = await http.get(uri);
    List body = jsonDecode(res.body);
    pokemonModel = body.map((e) => PokemonModel.fromJson(e)).toList();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      child: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.1),
              borderRadius: BorderRadius.circular(60),
            ),
            height: MediaQuery.of(context).size.height / 1.6,
            child: SinglePokemon(
              pokemonModel: pokemonModel[i],
            ),
          );
        },
      ),
    );
  }
}
