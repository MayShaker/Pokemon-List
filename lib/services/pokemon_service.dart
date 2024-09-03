import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon_model.dart';

class PokemonService {
  final String apiUrl = 'https://pokeapi.co/api/v2/pokemon?limit=20';

  Future<List<Pokemon>> fetchPokemons() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List pokemons = data['results'];

      List<Pokemon> pokemonList = [];
      for (var item in pokemons) {
        final detailsResponse = await http.get(Uri.parse(item['url']));
        final detailsData = json.decode(detailsResponse.body);
        pokemonList.add(Pokemon.fromJson(detailsData));
      }

      return pokemonList;
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }
}
