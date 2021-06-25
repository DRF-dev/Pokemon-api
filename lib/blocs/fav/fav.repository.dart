import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/views/accueil/tab-pokemon/models/pokemon.model.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/single-pokemon.tab-pokemon.dart';

class FavRepository {
  static final instance = FavRepository._singleton();
  FavRepository._singleton();
  List<SinglePokemon> pokemons = [];
  PokemonModel? pokemonModel;

  addFavorite(SinglePokemon singlePokemon) {
    pokemons.add(singlePokemon);
  }

  removeFavorite(PokemonModel pokemonModel) {
    List<PokemonModel> pokemonModelList = pokemons
        .map(
          (e) => e.pokemonModel,
        )
        .toList();
    int index = pokemonModelList.indexOf(pokemonModel);
    pokemons.removeAt(index);
  }

  getPokemonByPokedexID(int id) async {
    Uri uri = Uri.parse("https://app.pokemon-api.xyz/pokemon/$id");
    http.Response res = await http.get(uri);
    Map<String, dynamic> body = jsonDecode(res.body);
    pokemonModel = PokemonModel.fromJson(body);
  }
}
