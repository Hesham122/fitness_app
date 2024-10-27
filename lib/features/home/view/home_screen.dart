import 'package:final_project/features/Home/widgets/custom_workout_card.dart';
import 'package:final_project/features/authentication/cubit/auth_cubit.dart';
import 'package:final_project/features/authentication/cubit/auth_states.dart';
import 'package:final_project/features/authentication/view/login_screen.dart';
import 'package:final_project/features/nutrition/views/nutrition_screen.dart';
import 'package:final_project/features/sleep/view/sleep_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors.dart';
import '../../Steps/view/step_screen.dart';
import '../../water/view/water_screen.dart';
import '../widgets/custom_target_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit.get(context).getUserData();
        return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        //Colorsapp.darkGrey,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 15.0, left: 15, top: 60, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   "Home",
                      //   style: TextStyle(
                      //     color: Colorsapp.darkOrange,
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 34,
                      //   ),
                      // ),
                      Text(
                        "Hello, ${AuthCubit.get(context).name ?? ""}",
                        style: TextStyle(
                          color: Colorsapp.darkOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        AuthCubit.get(context).signOut().then((value) {
                          Navigator.push(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        });
                      },
                      child: Icon(
                        Icons.exit_to_app,
                        color: Colorsapp.liteGrey,
                        size: 30,
                      )
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            const CustomWorkoutCard(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.8,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.1,
                children: [
                  CustomTargetCard(
                    title: "Nutrition",
                    image: "assets/images/salad.png",
                    route: const NutritionScreen(),
                    context: context,
                    des: "Keep fit with healthy recipes",
                  ),
                  CustomTargetCard(
                    title: "Steps",
                    image: "assets/images/walk.png",
                    route: const StepsScreen(),
                    context: context,
                    des: "Take 8000 steps per day",
                  ),
                  CustomTargetCard(
                    title: "Water",
                    image: "assets/images/water.png",
                    route: const WaterScreen(),
                    context: context,
                    des: "Drink 8 glasses of water per day",
                  ),
                  CustomTargetCard(
                    title: "Sleep",
                    image: "assets/images/sleep_blue.png",
                    route: const SleepScreen(),
                    context: context,
                    des: "Sleep 8 Hours per day",
                  ),
                  // CustomTargetCard(),
                  // CustomTargetCard(),
                  // CustomTargetCard(),
                ],
              ),
            ),
          ],
        ),
      );},
    );
  }
}
