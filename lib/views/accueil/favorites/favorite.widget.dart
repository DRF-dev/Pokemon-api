import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/fav/fav.bloc.dart';
import 'package:pokemon/blocs/fav/fav.state.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavBloc, FavState>(
      builder: (context, state) {
        if (state is FavStateWithValue) {
          return ListView.builder(
            itemCount: state.pokemons.length,
            itemBuilder: (context, index) => state.pokemons[index],
          );
        }
        return Center(
          child: Text("No pokemons"),
        );
      },
    );
  }
}
