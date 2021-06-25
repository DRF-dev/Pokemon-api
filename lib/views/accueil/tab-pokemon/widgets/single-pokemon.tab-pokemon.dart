import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/fav/fav.bloc.dart';
import 'package:pokemon/blocs/fav/fav.events.dart';
import 'package:pokemon/blocs/fav/fav.state.dart';
import 'package:pokemon/views/accueil/tab-pokemon/models/pokemon.model.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/favorite-button.tab-pokemon.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/stat/models/characteristic.model.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/stat/stat.tab-pokemon.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/type.tab-pokemon.dart';

class SinglePokemon extends StatelessWidget {
  final PokemonModel pokemonModel;
  SinglePokemon({required this.pokemonModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: Image.network(pokemonModel.imgUrl),
        ),
        Text(
          pokemonModel.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
        TypeTabPokemon(types: pokemonModel.types),
        Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        StatTabPokemon(characteristics: [
          Characteristic(
            characteristic: "Heigth",
            value: pokemonModel.heigth,
          ),
          Characteristic(
            characteristic: "Weigth",
            value: pokemonModel.weigth,
          ),
          Characteristic(
            characteristic: "HP",
            value: pokemonModel.hp.toString(),
          ),
        ]),
        Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        StatTabPokemon(characteristics: [
          Characteristic(
            characteristic: "Attaque",
            value: pokemonModel.attack.toString(),
          ),
          Characteristic(
            characteristic: "Défense",
            value: pokemonModel.defence.toString(),
          ),
          Characteristic(
            characteristic: "Vitesse",
            value: pokemonModel.speed.toString(),
          ),
        ]),
        Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        StatTabPokemon(characteristics: [
          Characteristic(
            characteristic: "Attaque spé",
            value: pokemonModel.attacksp.toString(),
          ),
          Characteristic(
            characteristic: "Défence spé",
            value: pokemonModel.defencesp.toString(),
          ),
        ]),
        Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        BlocBuilder<FavBloc, FavState>(
          builder: (context, state) {
            if (state is FavStateWithValue) {
              List isFavorite = state.pokemons
                  .where((e) => e.pokemonModel == pokemonModel)
                  .toList();
              print(isFavorite.length);
              print(isFavorite.length != 0);
              if (isFavorite.length != 0) {
                return IconButton(
                  icon: Icon(Icons.favorite),
                  color: Colors.white,
                  iconSize: 50,
                  onPressed: () => BlocProvider.of<FavBloc>(context).add(
                    RemoveFavoriteEvent(singlePokemon: pokemonModel),
                  ),
                );
              }
              return FavoriteButtonTabPokemon(pokemonModel: pokemonModel);
            }
            return FavoriteButtonTabPokemon(pokemonModel: pokemonModel);
          },
        )
      ],
    );
  }
}
