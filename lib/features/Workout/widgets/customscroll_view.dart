import 'package:flutter/material.dart';
import 'fitness_list.dart';

class Customscrollview extends StatelessWidget {
  const Customscrollview({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: FitnessList(),
        )
      ],
    );
  }
}