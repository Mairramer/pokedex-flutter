import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/src/core/consts/consts_api.dart';
import 'package:pokedex/src/models/poke_api_model.dart';
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  Dio dio;

  @observable
  PokeApi pokeApi;

  @action
  fetchPokemonList() {
    pokeApi = null;
    loadPokeApi().then((pokeList) {
      pokeApi = pokeList;
    });
  }

  Future<PokeApi> loadPokeApi() async {
    try {
      final response = await dio.get(ConstsApi.pokeapiURL);
      var decodeJson = jsonDecode(response.data);
      return PokeApi.fromJson(decodeJson);
    } catch (error) {
      print("Erro ao carregar list");
      return null;
    }
  }
}
