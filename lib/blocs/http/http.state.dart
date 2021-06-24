abstract class HttpState {}

class HttpEmptyState extends HttpState {}

class GetPokemonsState extends HttpState {
  final dynamic pokemons;
  GetPokemonsState({required this.pokemons});
}
