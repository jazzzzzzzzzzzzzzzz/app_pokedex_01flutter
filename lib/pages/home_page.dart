import 'dart:convert';

import 'package:app_pokedex_01flutter/wit/widgets/item_pokemon_widget.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  //Uri
  //Url

  List<Map<String, dynamic>> pokemons = [];

  getDataPokemon() async {
    Uri _uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      pokemons = myMap["pokemon"];
      //pokemons.forEach((element) {
      //  print(element["type"]);
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                "Pokedex",
                style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30.0,
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                childAspectRatio: 1.35,
                children: [
                  ItemPokemonWidget(),
                  ItemPokemonWidget(),
                  ItemPokemonWidget(),
                  ItemPokemonWidget(),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
