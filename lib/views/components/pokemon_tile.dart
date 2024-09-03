import 'package:flutter/material.dart';
import '../../models/pokemon_model.dart';

class PokemonTile extends StatelessWidget {
  final Pokemon pokemon;

  PokemonTile({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(pokemon.imageUrl),
      title: Text(
        pokemon.name,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        pokemon.type.join(', '), // Display Pokémon types
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }
}
