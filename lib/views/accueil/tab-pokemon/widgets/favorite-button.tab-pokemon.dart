import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/fav/fav.bloc.dart';
import 'package:pokemon/blocs/fav/fav.events.dart';
import 'package:pokemon/views/accueil/tab-pokemon/models/pokemon.model.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/single-pokemon.tab-pokemon.dart';

class FavoriteButtonTabPokemon extends StatelessWidget {
  PokemonModel pokemonModel;
  FavoriteButtonTabPokemon({required this.pokemonModel});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite_outline_outlined),
      color: Colors.white,
      iconSize: 50,
      onPressed: () => BlocProvider.of<FavBloc>(context).add(
        AddFavoriteEvent(
          singlePokemon: SinglePokemon(pokemonModel: pokemonModel),
        ),
      ),
    );
  }
}
