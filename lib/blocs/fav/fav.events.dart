import 'package:pokemon/views/accueil/tab-pokemon/models/pokemon.model.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/single-pokemon.tab-pokemon.dart';

abstract class FavEvents {}

class AddFavoriteEvent extends FavEvents {
  SinglePokemon singlePokemon;
  AddFavoriteEvent({required this.singlePokemon});
}

class RemoveFavoriteEvent extends FavEvents {
  PokemonModel singlePokemon;
  RemoveFavoriteEvent({required this.singlePokemon});
}

class SearchPokemonByIdEvent extends FavEvents {
  int pokedexId;
  SearchPokemonByIdEvent({required this.pokedexId});
}
