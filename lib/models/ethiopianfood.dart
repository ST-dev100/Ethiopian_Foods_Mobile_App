class Ethiopianfood {
  final String name;
  final String description;
  final String imageUrl;
  final String cookingInstructions; // New field

  Ethiopianfood({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.cookingInstructions,
  });

  static List<Ethiopianfood> getEthiopianfoods() {
    return [
      Ethiopianfood(
        name: 'Injera',
        description: 'A sourdough flatbread with a unique, spongy texture.',
        imageUrl: 'assets/images/injera.jpg',
        cookingInstructions:
            'Mix teff flour with water and let it ferment overnight. Cook on a hot skillet until spongy.',
      ),
      Ethiopianfood(
        name: 'Doro Wat',
        description: 'A spicy chicken stew served with hard-boiled eggs.',
        imageUrl: 'assets/images/dorowat.jpg',
        cookingInstructions:
            'Sauté onions with butter, add berbere spice, then chicken and simmer for 1-2 hours. Add boiled eggs before serving.',
      ),
      Ethiopianfood(
        name: 'Tibs',
        description:
            'Sautéed meat cubes often cooked with vegetables and spices.',
        imageUrl: 'assets/images/tibs.jpg',
        cookingInstructions:
            'Heat oil in a pan, add meat cubes and sauté until browned. Add chopped onions, garlic, and spices, cook for a few minutes. Then add vegetables and continue cooking until tender and flavorful. Serve hot with injera or rice.',
      ),
      Ethiopianfood(
        name: 'Kitfo',
        description:
            'Minced raw beef seasoned with spices and clarified butter.',
        imageUrl: 'assets/images/kitfo.jpg',
        cookingInstructions:
            'Mix minced beef with mitmita spice and niter kibbeh (spiced butter). Serve raw or lightly cooked.',
      ),
    ];
  }
}
