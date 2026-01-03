import 'package:flutter/material.dart';
import 'package:mobile2/models/ethiopianfood.dart';
import '../widgets/food_card.dart';
import '../widgets/search_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  late List<Ethiopianfood> allFoods;
  late List<Ethiopianfood> filteredFoods;

  @override
  void initState() {
    super.initState();
    allFoods = Ethiopianfood.getEthiopianfoods();
    filteredFoods = allFoods;
  }

  void _filterFoods(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredFoods = allFoods;
      } else {
        filteredFoods = allFoods
            .where((food) =>
                food.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _showCookingInstructions(Ethiopianfood food) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                food.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  food.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'How to cook:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
              const SizedBox(height: 5),
              Text(
                food.cookingInstructions,
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Ethiopian Foods'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SearchBox(
            controller: _searchController,
            onChanged: _filterFoods,
          ),
          const Text(
            'Welcome to Ethiopian Foods App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 220,
            child: filteredFoods.isEmpty
                ? const Center(
                    child: Text(
                      'No food found',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredFoods.length,
                    itemBuilder: (context, index) {
                      final food = filteredFoods[index];
                      return FoodCard(
                        food: food,
                        onTap: () => _showCookingInstructions(food),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
