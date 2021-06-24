import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/http/http.bloc.dart';
import 'package:pokemon/blocs/http/http.event.dart';

class ButtonTabPokemon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("Plus d'informations"),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      onPressed: () => BlocProvider.of<HttpBloc>(context).add(GetPokemons()),
    );
  }
}
