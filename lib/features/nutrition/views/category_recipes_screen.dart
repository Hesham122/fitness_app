import 'package:final_project/features/nutrition/views/recipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../cubit/nutrition_cubit.dart';
import '../cubit/nutrition_states.dart';

class CategoryRecipesScreen extends StatelessWidget {
const  CategoryRecipesScreen({super.key, required this.id});
final  int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NutritionCubit, NutritionStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NutritionCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              cubit.recipes.isEmpty?"":
              cubit.recipes[0].category.category,
              style: const TextStyle(color: Colors.white),
            ),
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                )),
          ),
          body: cubit.recipes.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/1.2,
                  child: ListView.builder(
                      itemCount: cubit.recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = cubit.recipes[index];
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return RecipeScreen(recipe: cubit.recipes[index]);}));
                          },
                          child: Card(
                            color: Colors.grey[900],
                            child: ListTile(
                              leading: Image.network(recipe.image??'',
                                  width: 50, height: 50, fit: BoxFit.cover),
                              title: Text(recipe.recipe, style: const TextStyle(color: Colors.deepOrange),),
                              subtitle: Text(
                                  'Calories: ${recipe.calories} kcal\nServing: ${recipe.serving}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              trailing: Text(recipe.difficulty, style: const TextStyle(color: Colors.deepOrange),),
                            ),
                          ),
                        );
                      },
                    ),
                ),
              ),
        );
      },
    );
  }
}
