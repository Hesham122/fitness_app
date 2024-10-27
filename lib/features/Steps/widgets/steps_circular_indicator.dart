import 'package:final_project/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StepsCircularIndicator extends StatelessWidget {
  const StepsCircularIndicator({super.key, required this.steps, required this.stepGoal});

  final int steps;
  final int stepGoal;
  @override
  Widget build(BuildContext context) {
    double percent = (steps / stepGoal).clamp(0.0, 1.0);
    return CircularPercentIndicator(
      radius: 120.0,
      lineWidth: 15.0,
      animation: true,
      percent: percent,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$steps",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 48.0,
              color: Colorsapp.darkOrange,
            ),
          ),
          Text(
            "Today's Goal\n$stepGoal Steps",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Colors.grey[300]!,
      progressColor: Colorsapp.darkOrange,
    );
  }
}