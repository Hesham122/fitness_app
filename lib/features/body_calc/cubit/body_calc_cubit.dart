import 'package:final_project/features/body_calc/cubit/body_calc_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyCalcCubit extends Cubit<BodyCalcStates> {
  BodyCalcCubit() : super(InitialState());
  static BodyCalcCubit get(context) => BlocProvider.of(context);

  int height = 170;
  int weight = 50;
  int age = 30;
  bool isMale = true;
  String selectedGender = "male";

  String changeGender() {
    if (isMale) {
      return selectedGender = "male";
    } else {
      return selectedGender = "female";
    }
  }

  ///********************BMI*******************************
  double bmi = 20;
  String calculateBMI() {
    double heightMeters = height / 100;
    bmi = (weight / (heightMeters * heightMeters));
    String inString = bmi.toStringAsFixed(1); // '2.35'
    bmi = double.parse(inString);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return "Overweight";
    } else if (bmi > 18.5)
      // ignore: curly_braces_in_flow_control_structures
      return "Normal";
    else
      // ignore: curly_braces_in_flow_control_structures
      return "Underweight";
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return "Your body weight is currently higher than the recommended weight. Consider some small changes such as taking the stairs over the elevator.";
    } else if (bmi > 18.5)
      // ignore: curly_braces_in_flow_control_structures
      return "Your body weight is exactly where it should be, keep on keeping on!";
    else
      // ignore: curly_braces_in_flow_control_structures
      return "Your body weight is a bit lower than the recommended weight, treat yourself to your favorite food or try lifting weights to gain muscle mass.";
  }

  ///********************BFP*******************************
  late double bfp;
  String calculateBFP() {
    // gender: 1 for male, 0 for female
    int gender;
    if (isMale) {
      gender = 1;
    } else {
      gender = 0;
    }
    bfp = (1.20 * bmi) + (0.23 * age) - (10.8 * gender) - 5.4;
    return bfp.toStringAsFixed(1);
  }

  String getResultBf() {
    if (isMale) {
      if (bfp <= 5) {
        return "Essential";
      } else if (bfp <= 13)
        // ignore: curly_braces_in_flow_control_structures
        return "Athletes";
      else if (bfp <= 17)
        // ignore: curly_braces_in_flow_control_structures
        return "Fitness";
      else if (bfp <= 24)
        // ignore: curly_braces_in_flow_control_structures
        return "Average";
      else
        // ignore: curly_braces_in_flow_control_structures
        return "Obese";
    } else {
      if (bfp <= 13) {
        return "Essential";
      } else if (bfp <= 20)
        // ignore: curly_braces_in_flow_control_structures
        return "Athletes";
      else if (bfp <= 24)
        // ignore: curly_braces_in_flow_control_structures
        return "Fitness";
      else if (bfp <= 31)
        // ignore: curly_braces_in_flow_control_structures
        return "Average";
      else
        // ignore: curly_braces_in_flow_control_structures
        return "Obese";
    }
  }

  String getInterpretationBf() {
    if (isMale) {
      if (bfp <= 5) {
        return "This is the minimum amount of fat required for normal physiological functioning.";
      } else if (bfp <= 13)
        // ignore: curly_braces_in_flow_control_structures
        return "Men in this range are generally very lean, and this is typical for athletes or those with highly active lifestyles.";
      else if (bfp <= 17)
        // ignore: curly_braces_in_flow_control_structures
        return "Healthy range for individuals with good physical fitness. This range is common for recreationally active people.";
      else if (bfp <= 24)
        // ignore: curly_braces_in_flow_control_structures
        return "An average or typical body fat percentage. Most men fall into this category.";
      else
        // ignore: curly_braces_in_flow_control_structures
        return "A BFP of 25% or higher is considered obese and can indicate increased health risks like cardiovascular disease, type 2 diabetes, and hypertension.";
    } else {
      if (bfp <= 13) {
        return "Women need a higher amount of essential fat for reproductive health and other physiological functions.";
      } else if (bfp <= 20)
        // ignore: curly_braces_in_flow_control_structures
        return "Typical for highly active women or athletes with very lean body compositions.";
      else if (bfp <= 24)
        // ignore: curly_braces_in_flow_control_structures
        return "A healthy range for individuals who engage in regular exercise and maintain good fitness levels.";
      else if (bfp <= 31)
        // ignore: curly_braces_in_flow_control_structures
        return "The average range for women in general population.";
      else
        // ignore: curly_braces_in_flow_control_structures
        return "A BFP of 32% or higher is classified as obese, which could be a sign of excess body fat and is often associated with increased health risks.";
    }
  }

  ///********************IBW*******************************
  late String minWeight;
  late String maxWeight;
  late double mnWeight;
  late double mxWeight;

  calculateIBW() {
    double heightMeters = height / 100;
    mnWeight = 18.5 * (heightMeters * heightMeters);
    mxWeight = 24.9 * (heightMeters * heightMeters);
    minWeight = mnWeight.toStringAsFixed(1);
    maxWeight = mxWeight.toStringAsFixed(1);
  }

  ///********************BMR*******************************

  late double bmr;
  String calculateBMR() {
    if (isMale) {
      bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
    String inString = bmr.toStringAsFixed(1); // '2.35'
    bmr = double.parse(inString);
    return bmr.toStringAsFixed(1);
  }
}
