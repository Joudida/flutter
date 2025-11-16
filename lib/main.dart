import 'package:flutter/material.dart';
import 'meal.dart';
import 'meals_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Meal Tracker',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: MealPage(),
    );
  }
}

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState()=> _MealPageState();
}

class _MealPageState extends State<MealPage>{
  @override
  Widget build(BuildContext context){
    int totalCalories = meals.where((m)=> m.eaten).fold(0, (sum,m) => sum + m.calories);

    return Scaffold(
      appBar: AppBar(title: Text('Daily Meal Tracker')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount:meals.length,
                itemBuilder: (ctx, index){
                  final meal =meals[index];
                  return CheckboxListTile(
                    title: Text('${meal.name} (${meal.calories} cal)'),
                    value: meal.eaten,
                     onChanged: (val){
                      setState(() {
                        meal.eaten = val!;
                      });
                     },
                     );
                },
              ),
            
            ),
            Divider(),
            Text('Total Calories Consumed: $totalCalories',
                 style: TextStyle(fontSize: 18,fontWeight: fontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
