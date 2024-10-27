import 'package:final_project/features/nutrition/model/category.dart';
import 'package:final_project/features/nutrition/widgets/divider.dart';
import 'package:flutter/material.dart';

class RecipeDetails extends StatelessWidget {
const  RecipeDetails({super.key, required this.recipe});
final  Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "calories",
                  style: TextStyle(color: Colors.deepOrange[300], fontSize: 16),
                ),
                Text(
                  "${recipe.calories.toString()} cal",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              children: [
                Text("fats",
                    style:
                        TextStyle(color: Colors.deepOrange[300], fontSize: 16)),
                Text(
                  "${recipe.fatInGrams.toString()} g",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              children: [
                Text("carbohydrates",
                    style:
                        TextStyle(color: Colors.deepOrange[300], fontSize: 16)),
                Text(
                  "${recipe.carbohydratesInGrams.toString()} g",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              children: [
                Text("protein",
                    style:
                        TextStyle(color: Colors.deepOrange[300], fontSize: 16)),
                Text(
                  "${recipe.proteinInGrams.toString()} g",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        const RecipeDivider(),
        Row(
          children: [
            Text("preparation time: ",
                style: TextStyle(color: Colors.deepOrange[300], fontSize: 16)),
            Text(
              "${recipe.prepTimeInMinutes.toString()} min",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        Row(
          children: [
            Text("cook time: ",
                style: TextStyle(color: Colors.deepOrange[300], fontSize: 16)),
            Text(
              "${recipe.cookTimeInMinutes.toString()} min",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        const RecipeDivider(),
      ],
    );
  }
}
