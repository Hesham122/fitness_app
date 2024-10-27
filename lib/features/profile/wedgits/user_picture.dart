import 'package:final_project/core/utils/colors.dart';
import 'package:flutter/material.dart';

class UserPicture extends StatelessWidget {
  const UserPicture({super.key});

  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.all(3),
        margin: EdgeInsets.symmetric(vertical: sizee.height / 8),
        height: sizee.height / 7,
        width: sizee.width / 3.6,
        decoration: BoxDecoration(
            color: Colorsapp.darkOrange,
            borderRadius: BorderRadius.circular(12)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(fit: BoxFit.fill, "assets/images/workout.jpeg"),
        ),
      ),
    );
  }
}
