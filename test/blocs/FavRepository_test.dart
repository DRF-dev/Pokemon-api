import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon/blocs/fav/fav.repository.dart';
import 'package:pokemon/views/accueil/tab-pokemon/models/pokemon.model.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/single-pokemon.tab-pokemon.dart';

// class MockClient extends Mock implements Client {}
@GenerateMocks([Client])
void main() {
  group(
    'Fav repository',
    () {
      test(
        'Add an element',
        () {
          FavRepository favRepository = FavRepository();

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

          favRepository.addFavorite(myPokemon);

          expect(
            favRepository.pokemons,
            [myPokemon],
          );
        },
      );

      test(
        "Remove an element",
        () {
          FavRepository favRepository = FavRepository();

          PokemonModel pokemonModel = new PokemonModel(
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
          );

          SinglePokemon myPokemon = new SinglePokemon(
            pokemonModel: pokemonModel,
          );

          favRepository.pokemons = [myPokemon];

          favRepository.removeFavorite(pokemonModel);

          expect(favRepository.pokemons, []);
        },
      );

      test(
        "get pokemon by id",
        () async {
          final client = MockClient((_) async {
            return Response(
              "{\"name\":{\"french\":\"Dracaufeu\"},\"type\":[\"feu\",\"vol\"],\"base\": {\"HP\":300,\"Attack\":180,\"Defense\":125,\"Sp. Attack\":200,\"Sp. Defense\":100,\"Speed\":50},\"profile\": {\"height\":\"100\",\"weight\":\"250\"},\"hires\": \"http://sitedemerde.com\"}",
              200,
            );
          });

          FavRepository favRepository = FavRepository();

          /*when(
            client.get(Uri.parse("https://app.pokemon-api.xyz/pokemon/0")),
          ).thenAnswer(
            (_) async => ,
          );*/

          await favRepository.getPokemonByPokedexID(0);
          expect(
            favRepository.pokemonModel,
            new PokemonModel(
              name: "name",
              types: ["types"],
              hp: 100,
              attack: 100,
              defence: 100,
              attacksp: 100,
              defencesp: 100,
              speed: 100,
              heigth: "heigth",
              weigth: "weigth",
              imgUrl: "imgUrl",
            ),
          );
        },
      );
    },
  );
}
