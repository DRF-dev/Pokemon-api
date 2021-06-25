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
          if (state.pokemons.length == 0) {
            return Center(
              child: Text("No pokemons present in your favorite"),
            );
          }

          return ListView.builder(
            itemCount: state.pokemons.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.1),
                borderRadius: BorderRadius.circular(60),
              ),
              height: MediaQuery.of(context).size.height / 1.6,
              child: state.pokemons[index],
            ),
          );
        }
        return Center(
          child: Text("No pokemons present in your favorite"),
        );
      },
    );
  }
}
