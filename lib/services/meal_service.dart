import '../models/meal_model.dart';

class MealService {
final Map<String, List<Map<String, String>>> _data = {
  "Breakfast": [
    {
    "name": "Greek yogurt + Nuts",
    "calories": "320 kcal",
    "image":
    },
    {
    "name": "Greek yogurt + Nuts",
    "calories": "320 kcal",
    "image":
    },
    {
      "name": "Greek yogurt + Nuts",
    "calories": "320 kcal",
    "image":
    },
  ],
  "Lunch": [
    {
      "name": "Grilled Chicken +  Rice ",
      "calories": "520 calories",
      "image" :
    },
    {
        "name": "Salmon +  Quinoa Bowl",
      "calories": "560 calories",
      "image" :
    },
    {
       "name": "Tuna Salad",
      "calories": "340 calories",
      "image" :
    },
  ],
  "Dinner": [
   
    {
    "name" : "Soup + Salad",
     "calories" : "250 kcal",
     "image":
    },

     {
    "name" : "Grilled Fish + Veg",
     "calories" : " 300 kcal",
     "image":
    }, 

     {
    "name" : "Cottage Cheese Bowl ",
     "calories" : "210 kcal",
     "image":
    },
  ],
  "Snack" : [
    {
       
    "name" : "Apple + Almonds",
     "calories" : "180 kcal",
     "image":
    
  },
   {
    "name" : "Protein Bar",
     "calories" : "220 kcal",
     "image":
    },
     {
    "name" : "Hummus + Carrots",
     "calories" : "160 kcal",
     "image":
    },
  ],
};
 Future<List<Meal>> getMeals(String category) async {
  await Future.delayed(const Duration(milliseconds: 250));
  final list = _data[category] ?? [];
  return list.map((m)=> Meal.fromMap(m, category)).toList();
 }
 List<String> get categories => _data.keys.toList();
}
