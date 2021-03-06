import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/src/core/translations/app_translations.dart';
import 'package:pokedex/src/stores/pokeapi_store.dart';

import 'src/pages/home/home_page.dart';
import 'src/stores/pokeapiv2_store.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<PokeApiStore>(PokeApiStore());
  getIt.registerSingleton<PokeApiV2Store>(PokeApiV2Store());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Pokedex',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        translationsKeys: AppTranslation.translations,
        locale: Get.deviceLocale);
  }
}
