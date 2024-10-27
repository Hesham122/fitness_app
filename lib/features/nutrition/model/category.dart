class CategoryModel {
  final int id;
  final String category;
  final String thumbnail;

  CategoryModel({
    required this.id,
    required this.category,
    required this.thumbnail,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0, // Default to 0 if id is null
      category: json['category'] ?? 'Unknown', // Default to 'Unknown' if category is null
      thumbnail: json['thumbnail'] ?? '', // Default to empty string if thumbnail is null
    );
  }
}
class Category {
  final int id;
  final String category;
  final String thumbnail;

  Category({
    required this.id,
    required this.category,
    required this.thumbnail,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      category: json['category'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'thumbnail': thumbnail,
    };
  }
}

class Recipe {
  final int id;
  final String recipe;
  final Category category;
  final int? prepTimeInMinutes;
  final String? prepTimeNote;
  final int? cookTimeInMinutes;
  final String? cookTimeNote;
  final String difficulty;
  final int serving;
  final double? measurement1;
  final double? measurement2;
  final double? measurement3;
  final double? measurement4;
  final double? measurement5;
  final double? measurement6;
  final double? measurement7;
  final double? measurement8;
  final double? measurement9;
  final double? measurement10;
  final String? ingredient1;
  final String? ingredient2;
  final String? ingredient3;
  final String? ingredient4;
  final String? ingredient5;
  final String? ingredient6;
  final String? ingredient7;
  final String? ingredient8;
  final String? ingredient9;
  final String? ingredient10;
  final String? directionsStep1;
  final String? directionsStep2;
  final String? directionsStep3;
  final String? directionsStep4;
  final String? directionsStep5;
  final String? directionsStep6;
  final String? directionsStep7;
  final String? directionsStep8;
  final String? directionsStep9;
  final String? directionsStep10;
  final String? image;
  final String? imageAttributionName;
  final String? imageAttributionUrl;
  final bool imageCreativeCommons;
  final String? chef;
  final String? sourceUrl;
  final double calories;
  final double fatInGrams;
  final double carbohydratesInGrams;
  final double proteinInGrams;

  Recipe({
    required this.id,
    required this.recipe,
    required this.category,
     this.prepTimeInMinutes,
    this.prepTimeNote,
     this.cookTimeInMinutes,
    this.cookTimeNote,
    required this.difficulty,
    required this.serving,
    this.measurement1,
    this.measurement2,
    this.measurement3,
    this.measurement4,
    this.measurement5,
    this.measurement6,
    this.measurement7,
    this.measurement8,
    this.measurement9,
    this.measurement10,
    this.ingredient1,
    this.ingredient2,
    this.ingredient3,
    this.ingredient4,
    this.ingredient5,
    this.ingredient6,
    this.ingredient7,
    this.ingredient8,
    this.ingredient9,
    this.ingredient10,
    this.directionsStep1,
    this.directionsStep2,
    this.directionsStep3,
    this.directionsStep4,
    this.directionsStep5,
    this.directionsStep6,
    this.directionsStep7,
    this.directionsStep8,
    this.directionsStep9,
    this.directionsStep10,
    this.image,
    this.imageAttributionName,
    this.imageAttributionUrl,
    required this.imageCreativeCommons,
    this.chef,
    this.sourceUrl,
    required this.calories,
    required this.fatInGrams,
    required this.carbohydratesInGrams,
    required this.proteinInGrams,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      recipe: json['recipe'],
      category: Category.fromJson(json['category']),
      prepTimeInMinutes: json['prep_time_in_minutes'],
      prepTimeNote: json['prep_time_note'],
      cookTimeInMinutes: json['cook_time_in_minutes'],
      cookTimeNote: json['cook_time_note'],
      difficulty: json['difficulty'],
      serving: json['serving'],
      measurement1: (json['measurement_1'] as num?)?.toDouble(),
      measurement2: (json['measurement_2'] as num?)?.toDouble(),
      measurement3: (json['measurement_3'] as num?)?.toDouble(),
      measurement4: (json['measurement_4'] as num?)?.toDouble(),
      measurement5: (json['measurement_5'] as num?)?.toDouble(),
      measurement6: (json['measurement_6'] as num?)?.toDouble(),
      measurement7: (json['measurement_7'] as num?)?.toDouble(),
      measurement8: (json['measurement_8'] as num?)?.toDouble(),
      measurement9: (json['measurement_9'] as num?)?.toDouble(),
      measurement10: (json['measurement_10'] as num?)?.toDouble(),
      ingredient1: json['ingredient_1'],
      ingredient2: json['ingredient_2'],
      ingredient3: json['ingredient_3'],
      ingredient4: json['ingredient_4'],
      ingredient5: json['ingredient_5'],
      ingredient6: json['ingredient_6'],
      ingredient7: json['ingredient_7'],
      ingredient8: json['ingredient_8'],
      ingredient9: json['ingredient_9'],
      ingredient10: json['ingredient_10'],
      directionsStep1: json['directions_step_1'],
      directionsStep2: json['directions_step_2'],
      directionsStep3: json['directions_step_3'],
      directionsStep4: json['directions_step_4'],
      directionsStep5: json['directions_step_5'],
      directionsStep6: json['directions_step_6'],
      directionsStep7: json['directions_step_7'],
      directionsStep8: json['directions_step_8'],
      directionsStep9: json['directions_step_9'],
      directionsStep10: json['directions_step_10'],
      image: json['image'],
      imageAttributionName: json['image_attribution_name'],
      imageAttributionUrl: json['image_attribution_url'],
      imageCreativeCommons: json['image_creative_commons'],
      chef: json['chef'],
      sourceUrl: json['source_url'],
      calories: (json['calories'] as num).toDouble(),
      fatInGrams: (json['fat_in_grams'] as num).toDouble(),
      carbohydratesInGrams: (json['carbohydrates_in_grams'] as num).toDouble(),
      proteinInGrams: (json['protein_in_grams'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'recipe': recipe,
      'category': category.toJson(),
      'prep_time_in_minutes': prepTimeInMinutes,
      'prep_time_note': prepTimeNote,
      'cook_time_in_minutes': cookTimeInMinutes,
      'cook_time_note': cookTimeNote,
      'difficulty': difficulty,
      'serving': serving,
      'measurement_1': measurement1,
      'measurement_2': measurement2,
      'measurement_3': measurement3,
      'measurement_4': measurement4,
      'measurement_5': measurement5,
      'measurement_6': measurement6,
      'measurement_7': measurement7,
      'measurement_8': measurement8,
      'measurement_9': measurement9,
      'measurement_10': measurement10,
      'ingredient_1': ingredient1,
      'ingredient_2': ingredient2,
      'ingredient_3': ingredient3,
      'ingredient_4': ingredient4,
      'ingredient_5': ingredient5,
      'ingredient_6': ingredient6,
      'ingredient_7': ingredient7,
      'ingredient_8': ingredient8,
      'ingredient_9': ingredient9,
      'ingredient_10': ingredient10,
      'directions_step_1': directionsStep1,
      'directions_step_2': directionsStep2,
      'directions_step_3': directionsStep3,
      'directions_step_4': directionsStep4,
      'directions_step_5': directionsStep5,
      'directions_step_6': directionsStep6,
      'directions_step_7': directionsStep7,
      'directions_step_8': directionsStep8,
      'directions_step_9': directionsStep9,
      'directions_step_10': directionsStep10,
      'image': image,
      'image_attribution_name': imageAttributionName,
      'image_attribution_url': imageAttributionUrl,
      'image_creative_commons': imageCreativeCommons,
      'chef': chef,
      'source_url': sourceUrl,
      'calories': calories,
      'fat_in_grams': fatInGrams,
      'carbohydrates_in_grams': carbohydratesInGrams,
      'protein_in_grams': proteinInGrams,
    };
  }
}


