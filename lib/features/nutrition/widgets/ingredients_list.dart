import 'package:final_project/features/nutrition/model/category.dart';
import 'package:flutter/material.dart';

class IngredientsList extends StatelessWidget {
const  IngredientsList({super.key, required this.recipe});

final  Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(recipe.ingredient1 != null) Text(
            '- ${recipe.ingredient1}',
            style: const TextStyle(color: Colors.white),
          ),
        if(recipe.ingredient2 != null) Text(
          '- ${recipe.ingredient2}',
          style: const TextStyle(color: Colors.white),
        ),
        if(recipe.ingredient3 != null) Text(
          '- ${recipe.ingredient3}',
          style: const TextStyle(color: Colors.white),
        ),
        if(recipe.ingredient4 != null) Text(
          '- ${recipe.ingredient4}',
          style: const TextStyle(color: Colors.white),
        ),
        if(recipe.ingredient5 != null) Text(
          '- ${recipe.ingredient5}',
          style: const TextStyle(color: Colors.white),
        ),
        if(recipe.ingredient6 != null) Text(
          '- ${recipe.ingredient6}',
          style: const TextStyle(color: Colors.white),
        ),
        if(recipe.ingredient7 != null) Text(
          '- ${recipe.ingredient7}',
          style: const TextStyle(color: Colors.white),
        ),
        if(recipe.ingredient8 != null) Text(
          '- ${recipe.ingredient8}',
          style: const TextStyle(color: Colors.white),
        ),
        if(recipe.ingredient9 != null) Text(
          '- ${recipe.ingredient9}',
          style: const TextStyle(color: Colors.white),
        ),
        if(recipe.ingredient10 != null) Text(
          '- ${recipe.ingredient10}',
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
