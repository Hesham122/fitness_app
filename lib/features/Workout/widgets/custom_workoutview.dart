import 'package:flutter/material.dart';
import 'fitness_list.dart';

class CustomWorkoutview extends StatelessWidget {
  const CustomWorkoutview({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(size.width / 33),
        child: const FitnessList(),
      ),
    );
  }
}
