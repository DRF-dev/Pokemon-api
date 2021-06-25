import 'package:pokemon/views/accueil/tab-pokemon/models/pokemon.model.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/single-pokemon.tab-pokemon.dart';

abstract class FavState {}

class FavEmptyState extends FavState {}

class FavStateWithValue extends FavState {
  List<SinglePokemon> pokemons;
  PokemonModel? pokemonModel;
  FavStateWithValue({required this.pokemons, this.pokemonModel});
}
