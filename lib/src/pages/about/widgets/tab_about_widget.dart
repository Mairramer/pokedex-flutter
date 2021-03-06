import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/src/core/components/circular_progress_about.dart';
import 'package:pokedex/src/models/species_model.dart';
import 'package:pokedex/src/stores/pokeapiv2_store.dart';
import 'package:pokedex/src/stores/pokeapi_store.dart';
import 'package:get/get.dart';

class TabAboutWidget extends StatelessWidget {
  final PokeApiV2Store _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'descricao'.tr,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Observer(builder: (context) {
              Specie _specie = _pokeApiV2Store.specie;
              return SizedBox(
                  width: double.maxFinite,
                  height: 70,
                  child: SingleChildScrollView(
                      child: _specie != null
                          ? Text(
                              _specie.flavorTextEntries
                                  .where((item) => item.language.name == 'en')
                                  .first
                                  .flavorText
                                  .replaceAll("\n", " ")
                                  .replaceAll("\f", " ")
                                  .replaceAll("POKéMON", "Pokémon"),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )
                          : CircularProgressAbout()));
            }),
            SizedBox(
              height: 10,
            ),
            Text(
              'biologia'.tr,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Observer(builder: (context) {
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'altura'.tr,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          _pokeApiStore.pokemonAtual.height,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'peso'.tr,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          _pokeApiStore.pokemonAtual.weight,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
