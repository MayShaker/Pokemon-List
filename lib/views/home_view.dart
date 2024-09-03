import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pokemon_controller.dart';
import 'components/pokemon_tile.dart';

class HomeView extends StatelessWidget {
  final PokemonController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon Characters List'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.pokemonList.length,
            itemBuilder: (context, index) {
              final pokemon = controller.pokemonList[index];
              return PokemonTile(pokemon: pokemon);
            },
          );
        }
      }),
    );
  }
}
