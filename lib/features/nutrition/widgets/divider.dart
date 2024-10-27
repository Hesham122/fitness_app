import 'package:flutter/material.dart';

class RecipeDivider extends StatelessWidget {
   const RecipeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Divider(
        color: Colors.grey,
        height: .9,
        thickness: .5,
      ),
    );
  }
}
