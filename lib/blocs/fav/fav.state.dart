import 'package:pokemon/views/accueil/tab-pokemon/widgets/single-pokemon.tab-pokemon.dart';

abstract class FavState {}

class FavEmptyState extends FavState {}

class FavStateWithValue extends FavState {
  List<SinglePokemon> pokemons;
  FavStateWithValue({required this.pokemons});
}
