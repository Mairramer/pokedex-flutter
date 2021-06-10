import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:mobx/mobx.dart';
import 'package:pokedex/src/core/consts/consts_api.dart';
import 'package:pokedex/src/core/consts/consts_colors.dart';
import 'package:pokedex/src/models/poke_api_model.dart';
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeApi _pokeApi;

  @observable
  Pokemon _pokemonAtual;

  @observable
  dynamic corPokemon;

  @observable
  int posicaoAtual;

  @computed
  PokeApi get pokeAPI => _pokeApi;

  @computed
  Pokemon get pokemonAtual => _pokemonAtual;

  @action
  fetchPokemonList() {
    _pokeApi = null;
    loadPokeAPI().then((pokeList) {
      _pokeApi = pokeList;
    });
  }

  Pokemon getPokemon({int index}) {
    return _pokeApi.pokemon[index];
  }

  @action
  setPokemonAtual({int index}) {
    _pokemonAtual = _pokeApi.pokemon[index];
    corPokemon = ConstsColors.getColorType(type: _pokemonAtual.type[0]);
    posicaoAtual = index;
  }

  @action
  Widget getImage({String numero}) {
    return CachedNetworkImage(
      placeholder: (context, url) => new Container(
        color: Colors.transparent,
      ),
      imageUrl:
          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png',
    );
  }

  Future<PokeApi> loadPokeAPI() async {
    var url = Uri.parse(ConstsApi.pokeapiURL);
    try {
      final response = await http.get(url);
      var decodeJson = jsonDecode(response.body);
      return PokeApi.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}
