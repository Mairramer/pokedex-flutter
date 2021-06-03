import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/src/core/consts/consts_images.dart';
import 'package:pokedex/src/module/home/widgets/app_bar_widget.dart';
import 'package:pokedex/src/stores/pokeapi_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PokeApiStore _pokemonStore;

  @override
  void initState() {
    super.initState();
    _pokemonStore = GetIt.instance<PokeApiStore>();

    _pokemonStore.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusWidth = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: -(240 / 4.7),
              left: screenWidth - 240 / 1.6,
              child: Opacity(
                  opacity: 0.1,
                  child: Image.asset(
                    ConstImages.blackPokeball,
                    height: 240,
                    width: 240,
                  ))),
          Container(
            child: Column(
              children: [
                Container(
                  height: statusWidth,
                ),
                AppBarWidget(),
                Expanded(
                    child: Container(
                  child: Observer(
                      name: "Lista Pokemons",
                      builder: (BuildContext context) {
                        // ignore: unnecessary_null_comparison
                        return ((_pokemonStore.pokeApi != null)
                            ? ListView.builder(
                                itemCount:
                                    _pokemonStore.pokeApi!.pokemon.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(_pokemonStore
                                        .pokeApi!.pokemon[index].name),
                                  );
                                },
                              )
                            : Center(
                                child: Text("Erro"),
                              ));
                      }),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
