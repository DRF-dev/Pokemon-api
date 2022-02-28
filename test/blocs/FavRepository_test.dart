import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/blocs/fav/fav.repository.dart';
import 'package:pokemon/views/accueil/tab-pokemon/models/pokemon.model.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/single-pokemon.tab-pokemon.dart';

FavRepository favRepository = FavRepository();

void main() {
  group(
    'Fav repository',
    () {
      test(
        'Mon test truc',
        () {
          SinglePokemon myPokemon = new SinglePokemon(
            pokemonModel: new PokemonModel(
              name: "Dracaufeu",
              types: ["feu", "vol"],
              hp: 300,
              attack: 180,
              defence: 125,
              attacksp: 200,
              defencesp: 100,
              speed: 50,
              heigth: "25.0",
              weigth: "1000",
              imgUrl: "http://sitedemerde.com",
            ),
          );

          favRepository.addFavorite(
            myPokemon,
          );

          expect(
            favRepository.pokemons,
            [myPokemon],
          );
        },
      );
    },
  );
}
