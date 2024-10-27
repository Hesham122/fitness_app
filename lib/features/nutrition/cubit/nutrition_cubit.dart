 
import 'dart:developer';
import 'package:final_project/features/nutrition/model/category.dart';
import 'package:final_project/features/nutrition/widgets/cat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/network/network.dart';
import 'nutrition_states.dart';

class NutritionCubit extends Cubit<NutritionStates> {
  NutritionCubit() : super(InitialState());

  static NutritionCubit get(context) => BlocProvider.of(context);


  List<CategoryModel> categories = [];

  void getCategories() async {
    emit(GetCategoriesLoadingState());
    categories = Categories;
  }

  List<Recipe> recipes = [];

  void getAllCategories(int id) async {
    recipes = [];
    emit(GetAllCategoriesLoadingState());
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      try {
        var result = await NetworkHelper.instance.get(
          endPoint: "${EndPoints.allCategories}$id",
        );
        debugPrint(result.data.toString());
       List<dynamic> responseData = result.data;
       recipes = responseData.map((item) => Recipe.fromJson(item)).toList();
        debugPrint(result.data.toString());
        //Map<String, dynamic> responseData = jsonDecode(result.data);  // Decoding
        //List<Recipe> recipes = responseData.map((String key,dynamic value) => Recipe.fromJson(key, value)).toList();

        //List<dynamic> responseData = result.data;
        //List<Recipe> recipes = responseData.map((item) => Recipe.fromJson(item)).toList();
        ///recipes = responseData.map((item) => Recipe.fromJson(item)).toList();
         //Map<String, dynamic> responseData = result.data;  // Use a Map instead of List
         //List<dynamic> recipeList = responseData['recipes'];  // Access the 'recipes' list
         //recipes = recipeList.map((item) => Recipe.fromJson(item)).toList();  // Map each item

        emit(GetAllCategoriesSuccessState());
      } catch (e) {
        emit(GetAllCategoriesErrorState());
        log(e.toString(), name: "Meals Categories Info Lose Weight Cubit");
      }
    });
  }
}
