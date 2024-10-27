import 'package:flutter/material.dart';
import 'colors.dart';

const kBottomContainerHeight = 65.0;
var kReusableCardColor = Colorsapp.darkGrey;
//Color(0xFF1D1E33);
const kChosenGenderColor = Color(0xFFEF5B2B);
//Color(0xFF111328);
const kBottomContainerColor = Color(0xFFEB1555);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white
  //color: Color(0xFF8D8E98),
);

const kLabelNumberStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  color: Colors.white
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: Colors.white
);

 TextStyle kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
  color: Colors.deepOrange[400]
);

TextStyle kResultsTextStyle = TextStyle(
  color: Colors.deepOrange[800],
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
  color: Colors.white
);

const kResultsBodyTextStyle = TextStyle(
  fontSize: 22.0,
  color: Colors.white
);
const String ketoApiKey = "b6469b32aemsh32d9a234f097bd2p100733jsn283d5973a4b4";
/*
[
    {
         "id": 1,
         "recipe": "Chia And Blackberry Pudding",
         "category": {
             "id": 1,
             "category": "Breakfast Recipes",
             "thumbnail": "https://s3.us-west-004.backblazeb2.com/encurate/static/keto/1/Breakfast_R
              ecipes-Breakfast.png"
        }
         "prep_time_in_minutes": 45,
         "prep_time_note": null,
         "cook_time_in_minutes": 0,
         "cook_time_note": null,
         "difficulty": "Easy",
         "serving": 2,
         "measurement_1": 0.25,
         "measurement_2": 0.5,
         "measurement_3": 1.0,
         "measurement_4": 1.0,
         "measurement_5": 1.0,
         "measurement_6": null,
         "measurement_7": null,
         "measurement_8": null,
         "measurement_9": null,
         "measurement_10": null,
         "ingredient_1": "cup chia seeds",
         "ingredient_2": "cup blackberries, fresh",
         "ingredient_3": "teaspoon liquid sweetener",
         "ingredient_4": "cup coconut milk, full fat and unsweetened",
         "ingredient_5": "teaspoon vanilla extract",
         "ingredient_6": null,
         "ingredient_7": null,
         "ingredient_8": null,
         "ingredient_9": null,
         "ingredient_10": null,
         "directions_step_1": "Take the vanilla ,liquid sweetener and coconut milk and add to blender"
         "directions_step_2": "Process until thick",
         "directions_step_3": "Add in blackberries and process until smooth",
         "directions_step_4": "Divide the mixture between cups and chill for 30 minutes",
         "directions_step_5": "Serve and enjoy!",
         "directions_step_6": null,
         "directions_step_7": null,
         "directions_step_8": null,
         "directions_step_9": null,
         "directions_step_10": null,
         "image": "https://s3.us-west-004.backblazeb2.com/encurate/static/keto/1/Chia_And_Blackb
          erry_Pudding-Chia_And_Blackberry_Pudding.jpg"
         "image_attribution_name": null,
         "image_attribution_url": null,
         "image_creative_commons": true,
         "chef": null,
         "source_url": null,
         "calories": 437.0,
         "fat_in_grams": 38.0,
         "carbohydrates_in_grams": 8.0,
         "protein_in_grams": 8.0
    },
    {
         "id": 2,
         "recipe": "Cinnamon Chiller",
         "category": {
             "id": 1,
             "category": "Breakfast Recipes",
             "thumbnail": "https://s3.us-west-004.backblazeb2.com/encurate/static/keto/1/Breakfast_R
              ecipes-Breakfast.png"
        }
         "prep_time_in_minutes": 10,
         "prep_time_note": null,
         "cook_time_in_minutes": 0,
         "cook_time_note": null,
         "difficulty": "Easy",
         "serving": 1,
         "measurement_1": 1.0,
         "measurement_2": 2.0,
         "measurement_3": 0.5,
         "measurement_4": 0.25,
         "measurement_5": 1.0,
         "measurement_6": 1.0,
         "measurement_7": null,
         "measurement_8": null,
         "measurement_9": null,
         "measurement_10": null,
         "ingredient_1": "cup unsweetened almond milk",
         "ingredient_2": "tablespoons vanilla protein powder",
         "ingredient_3": "teaspoon cinnamon",
         "ingredient_4": "teaspoon vanilla extract",
         "ingredient_5": "tablespoon chia seeds",
         "ingredient_6": "cup ice cubs",
         "ingredient_7": null,
         "ingredient_8": null,
         "ingredient_9": null,
         "ingredient_10": null,
         "directions_step_1": "Add listed ingredients to blender",
         "directions_step_2": "Blend until you have a smooth and creamy texture",
         "directions_step_3": "Serve chilled and enjoy!",
         "directions_step_4": null,
         "directions_step_5": null,
         "directions_step_6": null,
         "directions_step_7": null,
         "directions_step_8": null,
         "directions_step_9": null,
         "directions_step_10": null,
         "image": "https://s3.us-west-004.backblazeb2.com/encurate/static/keto/1/Cinnamon_Chille
          r-Cinnamon_Chiller.jpg"
         "image_attribution_name": null,
         "image_attribution_url": null,
         "image_creative_commons": true,
         "chef": null,
         "source_url": null,
         "calories": 145.0,
         "fat_in_grams": 4.0,
         "carbohydrates_in_grams": 1.6,
         "protein_in_grams": 0.6
    }
]
 */

