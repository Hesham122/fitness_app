import 'package:final_project/features/nutrition/cubit/nutrition_states.dart';
import 'package:final_project/features/nutrition/model/category.dart';
import 'package:final_project/features/nutrition/widgets/ingredients_list.dart';
import 'package:final_project/features/nutrition/widgets/instructions_list.dart';
import 'package:final_project/features/nutrition/widgets/recipe_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubit/nutrition_cubit.dart';

class RecipeScreen extends StatelessWidget {
final  Recipe recipe;
const  RecipeScreen({super.key, required this.recipe});
  //int id;

 

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NutritionCubit, NutritionStates>(
      listener: (context, state) {},
      builder: (context, state) {
        //NutritionCubit.get(context).getAllCategories(this.id);
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              'Recipe Details',
              style: TextStyle(color: Colors.white),
            ),
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                )),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  recipe.difficulty,
                  style: TextStyle(color: Colors.deepOrange[300]),),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.recipe,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.deepOrange[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Image.network(
                      recipe.image ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  RecipeDetails(recipe: recipe),
                  Text(
                    'Ingredients:',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.deepOrange[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IngredientsList(recipe: recipe),
                  const SizedBox(height: 16),
                  Text(
                      'Instructions:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.deepOrange[300],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  InstructionsList(recipe: recipe),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
