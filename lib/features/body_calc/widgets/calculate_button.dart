import 'package:flutter/material.dart';
import '../../../core/utils/constant_var.dart';

class CalculateButton extends StatelessWidget {

  const CalculateButton({super.key, required this.onTap, required this.buttonTitle});

  final Function() onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container( // colored footer container
        color: Colors.deepOrange[400],
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 10.0),
        width: double.infinity, // makes widget expand across the screen
        height: kBottomContainerHeight, // colored footer container
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle
          ),
        ),
      ),
    );
  }
}