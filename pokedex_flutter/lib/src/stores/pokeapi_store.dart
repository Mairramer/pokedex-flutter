import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mobx/mobx.dart';
import 'package:pokedex/src/core/consts/consts_api.dart';
import 'package:pokedex/src/models/poke_api_model.dart';
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeApi? _pokeApi;

  @computed
  PokeApi? get pokeApi => _pokeApi;

  @action
  fetchPokemonList() {
    loadPokeApi().then((pokeList) {
      _pokeApi = pokeList!;
    });
  }

  Future<PokeApi?> loadPokeApi() async {
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
