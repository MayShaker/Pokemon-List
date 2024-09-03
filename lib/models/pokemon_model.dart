class Pokemon {
  final String name;
  final String imageUrl;
  final List<String> type;

  Pokemon({
    required this.name,
    required this.imageUrl,
    required this.type,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
      type: List<String>.from(
        json['types'].map((typeInfo) => typeInfo['type']['name']),
      ),
    );
  }
}
