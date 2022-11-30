import 'package:app_pokedex_01flutter/wit/widgets/item_type_widget.dart';
import 'package:flutter/material.dart';

class ItemPokemonWidget extends StatelessWidget {
  //String name;
  //String image;
  //List<String> types;

  PokemonModel pokemon;

  ItemPokemonWidget({
    //required this.name,
    //required this.image,
    // required this.types,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 76, 167, 84),
          borderRadius: BorderRadius.circular(18.0)),
      child: Stack(
        children: [
          Positioned(
            bottom: -20,
            right: -20,
            child: Image.asset(
              'assets/images/pokebal.png',
              height: 120.0,
              color: Colors.white.withOpacity(0.27),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //Column(
                //  children: types.map((e) => ItemTypeWidget()) .toList(),

                //),

                ...types
                    .map((e) => ItemTypeWidget(
                          text: e,
                        ))
                    .toList(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.network(image),
          ),
        ],
      ),
    );
  }
}
