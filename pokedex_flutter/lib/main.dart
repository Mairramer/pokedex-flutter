import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/src/stores/pokeapi_store.dart';

import 'src/pages/home/home_page.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<PokeApiStore>(PokeApiStore());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
