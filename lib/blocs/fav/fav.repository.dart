import 'package:pokemon/views/accueil/tab-pokemon/widgets/single-pokemon.tab-pokemon.dart';

class FavRepository {
  static final instance = FavRepository._singleton();
  FavRepository._singleton();
  List<SinglePokemon> pokemons = [];

  addFavorite(SinglePokemon singlePokemon) {
    pokemons.add(singlePokemon);
  }
}
