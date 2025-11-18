class Meal {
  final String name;
  final String calories;
  final String imageUrl;
  final String category;

  Meal({
    required this.name,
    required this.calories,
    required this.imageUrl,
    required this.category,
  });

  factory Meal.fromMap(Map<String, dynamic>m,String category) {
  return Meal(
    name: m['name'] ?? '',
    calories: m['calories']?? '' ,
    imageUrl: m['image'] ?? '',
    category: category,
  );
  }
}