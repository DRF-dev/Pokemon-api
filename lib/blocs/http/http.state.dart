abstract class HttpState {}

class HttpEmptyState extends HttpState {}

class Pokemons extends HttpState {
  final dynamic pokemons;
  Pokemons({required this.pokemons});
}
