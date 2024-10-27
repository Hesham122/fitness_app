import 'package:final_project/features/workout/views/workout_screen.dart';
import 'package:flutter/material.dart';

class CustomWorkoutCard extends StatelessWidget {
  const CustomWorkoutCard({super.key,});

  @override
  Widget build(BuildContext context) {
    return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  height: MediaQuery.of(context).size.height / 4,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    //color: Colors.grey[900],
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child:
                    Image(image: AssetImage("assets/images/cover.jpg",), fit: BoxFit.cover,),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Workout",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          const Text(
                            "Daily Challenge🔥",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20,),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const WorkoutScreen(),
                                  ));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: MediaQuery.of(context).size.height / 20,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange[400],
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Start",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                                  ),
                                   SizedBox(width: 10,),
                                  Icon(Icons.arrow_forward, color: Colors.white,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
                ),
              ],
            );
  }
}
