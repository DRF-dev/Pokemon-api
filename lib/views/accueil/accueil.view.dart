import 'package:flutter/material.dart';
import 'package:pokemon/views/accueil/favorites/favorite.widget.dart';
import 'package:pokemon/views/accueil/recherche/research.widget.dart';
import 'package:pokemon/views/accueil/tab-pokemon/tab-pokemon.widget.dart';

class AccueilView extends StatefulWidget {
  static const route = '/';

  @override
  _AccueilViewState createState() => _AccueilViewState();
}

class _AccueilViewState extends State<AccueilView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pokedex"),
        ),
        body: Column(
          children: <Widget>[
            TabBar(
              labelColor: Theme.of(context).primaryColor,
              controller: _tabController,
              tabs: <Widget>[
                Tab(text: 'Pokémon'),
                Tab(text: 'Recherche'),
                Tab(text: 'Favoris'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  TabPokemon(),
                  ResearchTab(),
                  Favorite(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
