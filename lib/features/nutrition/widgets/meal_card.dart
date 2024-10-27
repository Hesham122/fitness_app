import 'package:final_project/features/nutrition/cubit/nutrition_cubit.dart';
import 'package:final_project/features/nutrition/views/category_recipes_screen.dart';
import 'package:flutter/material.dart';
import 'custom_meal_button.dart';

class MealCard extends StatelessWidget {
const  MealCard(
      {super.key,
      required this.id,
      required this.title,
      required this.image});

final  int id;
final  String title;
final  String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 1.2,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Image.network(
                        image,
                        fit: BoxFit.fill,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            title,
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CustomMealButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    NutritionCubit.get(context).getAllCategories(id);
                    return CategoryRecipesScreen(id: id);
                  }));}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
