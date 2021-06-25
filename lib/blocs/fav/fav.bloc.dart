import 'package:flutter_bloc/flutter_bloc.dart';
import 'fav.events.dart';
import 'fav.repository.dart';
import 'fav.state.dart';

class FavBloc extends Bloc<FavEvents, FavState> {
  FavBloc() : super(FavEmptyState());

  @override
  Stream<FavStateWithValue> mapEventToState(FavEvents event) async* {
    final FavRepository favRepository = FavRepository.instance;
    if (event is AddFavoriteEvent) {
      favRepository.addFavorite(event.singlePokemon);
    }
    if (event is RemoveFavoriteEvent) {
      favRepository.removeFavorite(event.singlePokemon);
    }
    if (event is SearchPokemonByIdEvent) {
      favRepository.getPokemonByPokedexID(event.pokedexId);
    }
    yield FavStateWithValue(
      pokemons: favRepository.pokemons,
      pokemonModel: favRepository.pokemonModel,
    );
  }
}
