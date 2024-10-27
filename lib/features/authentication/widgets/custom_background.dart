import 'package:final_project/core/utils/colors.dart';
import 'package:flutter/material.dart';

import 'custom_cliper_shape.dart';


class FitnessBackground extends StatelessWidget {
  const FitnessBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background container with gradient
        Container(
          decoration: BoxDecoration(
            color: Colorsapp.liteGrey,
          ),
        ),
        // Adding shapes on the background
        ///top left
        Stack(
          children: [
            Positioned(
              top: -120,
              left: -120,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colorsapp.darkOrange,
                  //Colors.orange.shade600.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: -120,
              left: -120,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  color: Colorsapp.midOrange,
                  //Colors.orange.shade600.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: -120,
              left: -120,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colorsapp.liteOrange,
                  //Colors.orange.shade600.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        ///bottom right
        // Positioned(
        //   bottom: -100,
        //   right: -200,
        //   child: Container(
        //     width: 350,
        //     height: 450,
        //     decoration: BoxDecoration(
        //       color: Colorsapp.darkOrange,
        //       //Colors.orange.shade600.withOpacity(0.5),
        //       shape: BoxShape.circle,
        //     ),
        //   ),
        // ),
        ///***************************
        ///// Orange shape at the bottom-right
        Align(
          alignment: Alignment.bottomRight,
          child: ClipPath(
            clipper: BottomRightShapeClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .7,
              color: Colors.orange.shade600,
            ),
          ),
        ),
        const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Icon(Icons.fitness_center, color: Colors.white, size: 150,),
              //Text("Fitness", style: TextStyle(color: Colors.white, fontSize: 40),),
              Image(image: AssetImage("assets/images/Fitness.png"),),
            ],
          ),
        ),
      ],
    );
  }
}
