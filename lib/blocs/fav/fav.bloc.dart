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
    yield FavStateWithValue(pokemons: favRepository.pokemons);
  }
}
