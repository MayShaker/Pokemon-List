import 'package:get/get.dart';
import '../models/pokemon_model.dart';
import '../services/pokemon_service.dart';

class PokemonController extends GetxController {
  var isLoading = true.obs;
  var pokemonList = <Pokemon>[].obs;

  final PokemonService _pokemonService = PokemonService();

  @override
  void onInit() {
    super.onInit();
    fetchPokemons();
  }

  void fetchPokemons() async {
    try {
      isLoading(true);
      var pokemons = await _pokemonService.fetchPokemons();
      pokemonList.assignAll(pokemons);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load Pokémon');
    } finally {
      isLoading(false);
    }
  }
}
