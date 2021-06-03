import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import 'package:pokedex/src/core/consts/consts_api.dart';
import 'package:pokedex/src/models/poke_apiV2_model.dart';
import 'package:pokedex/src/models/species_model.dart';

part 'pokeapiv2_store.g.dart';

class PokeApiV2Store = _PokeApiV2StoreBase with _$PokeApiV2Store;

abstract class _PokeApiV2StoreBase with Store {
  @observable
  Specie? specie;

  @observable
  late PokeApiV2 pokeApiV2;

  @action
  Future<void> getInfoPokemon(String nome) async {
    var _url = Uri.parse(ConstsApi.pokeapiv2URL + nome.toLowerCase());
    try {
      final response = await http.get(_url);
      var decodeJson = jsonDecode(response.body);
      pokeApiV2 = PokeApiV2.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }

  @action
  Future<void> getInfoSpecie(String numPokemon) async {
    var _url = Uri.parse(ConstsApi.pokeapiv2EspeciesURL + numPokemon);
    try {
      specie = null;
      final response = await http.get(_url);
      var decodeJson = jsonDecode(response.body);
      var _specie = Specie.fromJson(decodeJson);
      specie = _specie;
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}
