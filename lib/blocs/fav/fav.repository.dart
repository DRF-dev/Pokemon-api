import 'package:pokemon/blocs/fav/fav.events.dart';
import 'package:pokemon/views/accueil/tab-pokemon/models/pokemon.model.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/single-pokemon.tab-pokemon.dart';

class FavRepository {
  static final instance = FavRepository._singleton();
  FavRepository._singleton();
  List<SinglePokemon> pokemons = [];

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
}
