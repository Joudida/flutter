import 'package:flutter/material.dart';
import '../services/meal_service.dart';
import '../models/meal_model.dart';

class MealPlanPage extends StatefulWidget {
  const MealPlanPage({super.key});

  @override
  State<MealPlanPage> createState() => _MealPlanPageState();
}

class _MealPlanPageState extends State<MealPlanPage> {
  String selectedMeal = "Breakfast";
  Meal? result;
  final service = MealService();

  void generateMeal() async {
    final meals = await service.getMeals(selectedMeal);
    meals.shuffle();
    setState(() {
      result = meals.first;
    });
  }

  IconData getMealIcon(String mealType) {
    switch (mealType) {
      case "Breakfast": return Icons.free_breakfast;
      case "Lunch": return Icons.lunch_dining;
      case "Dinner": return Icons.dinner_dining;
      case "Snack": return Icons.fastfood;
      default: return Icons.restaurant;
    }
  }

  Color getMealColor(String mealType) {
    switch (mealType) {
      case "Breakfast": return Colors.orange.shade300;
      case "Lunch": return Colors.green.shade300;
      case "Dinner": return Colors.blue.shade300;
      case "Snack": return Colors.purple.shade300;
      default: return Colors.grey.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ===== Navbar =====
      appBar: AppBar(
        title: const Text("Meal Plan Generator"),
        backgroundColor: getMealColor(selectedMeal),
      ),
      body: Column(
        children: [
          // ===== Banner Image =====
          Container(
            height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?fit=crop&w=800&q=80"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // ===== Expanded Scrollable Content =====
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Dropdown
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: DropdownButton<String>(
                          value: selectedMeal,
                          icon: Icon(getMealIcon(selectedMeal), color: getMealColor(selectedMeal)),
                          isExpanded: true,
                          underline: const SizedBox(),
                          items: const [
                            DropdownMenuItem(value: "Breakfast", child: Text("Breakfast")),
                            DropdownMenuItem(value: "Lunch", child: Text("Lunch")),
                            DropdownMenuItem(value: "Dinner", child: Text("Dinner")),
                            DropdownMenuItem(value: "Snack", child: Text("Snack")),
                          ],
                          onChanged: (v) {
                            setState(() {
                              selectedMeal = v!;
                              result = null;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Generate Button
                    ElevatedButton.icon(
                      onPressed: generateMeal,
                      icon: Icon(getMealIcon(selectedMeal)),
                      label: const Text("Generate Meal"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: getMealColor(selectedMeal),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Result Card
                    if (result != null)
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        color: getMealColor(selectedMeal).withOpacity(0.3),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(getMealIcon(selectedMeal), size: 28),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      result!.name,
                                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text("Calories: ${result!.calories}", style: const TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),

          // ===== Footer =====
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text("© 2025 Meal Plan App", style: TextStyle(fontSize: 14)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.facebook, size: 20),
                    SizedBox(width: 15),
                    Icon(Icons.email, size: 20),
                    SizedBox(width: 15),
                    Icon(Icons.home, size: 20),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}