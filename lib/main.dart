import 'package:flutter/material.dart';
import 'screens/meal_page.dart';
void main() {
  runApp(const MealApp());
}

class MealApp extends StatelessWidget {
  const MealApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Plan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3:true),
      home: const MealPlanPage(),
    );
  }
}