import 'package:final_project/features/Steps/view/step_screen.dart';
import 'package:final_project/features/authentication/cubit/auth_cubit.dart';
import 'package:final_project/features/authentication/view/login_screen.dart';
import 'package:final_project/features/profile/cubit/profile_cubit.dart';
import 'package:final_project/features/profile/cubit/profile_states.dart';
import 'package:final_project/features/profile/wedgits/custom_Auth_button.dart';
import 'package:final_project/features/profile/wedgits/progress_item.dart';
import 'package:final_project/features/sleep/view/sleep_screen.dart';
import 'package:final_project/features/water/view/water_screen.dart';
import 'package:final_project/features/workout/views/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../workout/widgets/favorite_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    ProfileCubit.get(context).initProfile();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50.0, left: 10),
                      child: Text("Profile", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>   const FavoritesScreen(),));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        //Color(0xff518d74),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Continue Your Workout', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: const BoxDecoration(
                                      //color: Colors.grey[300],
                                      borderRadius: BorderRadius.all(Radius.circular(15))
                                    ),
                                  child: const Image(image: AssetImage("assets/images/workout.jpeg"), width: 90,)),
                              const Text(
                                "Favorites Excercises",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              const Icon(Icons.play_circle_outline, size: 30,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ProgressItem(
                  title: "Drink Water",
                  subTitle: 'You drunk ${cubit.water} gl today 💧',
                  percent: ((cubit.water / 8) * 100).toInt(),
                  route: const WaterScreen(),
                ),
                ProgressItem(
                  title: "Steps Taken",
                  subTitle: 'Yoy took ${cubit.steps} steps today 👣',
                  percent: ((cubit.steps / 8000) * 100).toInt(),
                  route: const StepsScreen(),
                ),
                ProgressItem(
                  title: "Sleep Quality",
                  subTitle: 'you slept ${cubit.sleepHours} hours today 💤',
                  percent: cubit.sleepQuality,
                  route: const SleepScreen(),
                ),
                ProgressItem(
                  title: "Calories Burned",
                  subTitle: 'you burned ${cubit.calories} Cal today 🔥',
                  percent: cubit.totalCalories.toInt(),
                  route: const WorkoutScreen(),
                ),
                LogOutButton(text: "Log out",
                    onPressed: () {
                  AuthCubit.get(context).signOut().then((value){
                    // ignore: use_build_context_synchronously
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  });
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
