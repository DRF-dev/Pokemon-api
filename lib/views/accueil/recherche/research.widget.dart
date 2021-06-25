import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/fav/fav.bloc.dart';
import 'package:pokemon/blocs/fav/fav.events.dart';
import 'package:pokemon/blocs/fav/fav.state.dart';
import 'package:pokemon/views/accueil/tab-pokemon/widgets/single-pokemon.tab-pokemon.dart';

class ResearchTab extends StatefulWidget {
  @override
  _ResearchTabState createState() => _ResearchTabState();
}

class _ResearchTabState extends State<ResearchTab>
    with AutomaticKeepAliveClientMixin<ResearchTab> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  FormState get form => _key.currentState!;
  int? pokedexId;

  @override
  bool get wantKeepAlive => true;

  void submitForm(BuildContext context) {
    form.save();
    if (pokedexId != null) {
      return BlocProvider.of<FavBloc>(context).add(
        SearchPokemonByIdEvent(pokedexId: pokedexId!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                decoration: InputDecoration(
                  labelText: "Numéro du pokémon dans le pokédex",
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                keyboardType: TextInputType.number,
                onSaved: (newValue) {
                  newValue == null ? null : pokedexId = int.parse(newValue);
                },
              ),
              ElevatedButton(
                child: Text(
                  "Rechercher ce pokémon dans le pokedex",
                ),
                onPressed: () => submitForm(context),
              ),
              BlocBuilder<FavBloc, FavState>(
                builder: (context, state) {
                  if (state is FavStateWithValue) {
                    if (state.pokemonModel != null) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        height: MediaQuery.of(context).size.height / 1.6,
                        child: SinglePokemon(
                          pokemonModel: state.pokemonModel!,
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  }
                  return Center(
                    child: Text("Aucune recherche de pokémon en cours"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
