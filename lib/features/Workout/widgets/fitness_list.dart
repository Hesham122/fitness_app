import 'package:final_project/core/utils/workout_photo_main.dart';
import 'package:final_project/features/workout/cubit/workout_cubit.dart';
import 'package:final_project/features/workout/cubit/workout_states.dart';
import 'package:final_project/features/workout/widgets/specific_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FitnessList extends StatelessWidget {
  const FitnessList({super.key});

  @override
  Widget build(BuildContext context) {
    late int ind;
    var sizee = MediaQuery.of(context).size;
    return BlocConsumer<WorkoutCubit, WorkoutState>(listener: (context, state) {
      if (state is WorkoutSuccessful) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SpecificWorkout(
                      ind: ind,
                     
                    )));
      }
      if (state is WorkoutError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Fail, try again"),
          action: SnackBarAction(label: "Close", onPressed: () {}),
        ));
      }
    }, builder: (context, state) {
      return 
      state is WorkoutLoading?const Center(
        heightFactor: 20,
        child: CircularProgressIndicator(
          
        ),
      ):
      state is WorkoutSuccessful
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, index) {
                return AspectRatio(
                  aspectRatio: sizee.width * 3.37 / sizee.height * 1.11,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 7, horizontal: sizee.width / 76),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(allWorkoutPhoto[index].tphoto),
                          fit: BoxFit.cover),
                    ),
                    child: InkWell(
                      onTap: () {
                        if (index == 0) {
                          context.read<WorkoutCubit>().bodyPartBack("push");
                          ind = index;
                        } else if (index == 1) {
                          context.read<WorkoutCubit>().bodyPartBack("pull");
                          ind = index;
                        } else if (index == 2) {
                          context.read<WorkoutCubit>().bodyPartBack("legs");
                          ind = index;
                        } else if (index == 3) {
                          context.read<WorkoutCubit>().bodyPartBack("triceps");
                          ind = index;
                        } else if (index == 4) {
                          context.read<WorkoutCubit>().bodyPartBack("biceps");
                          ind = index;
                        }
                      },
                      child: Card(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(33),
                        ),
                        child: Container(
                          width: 300,
                          height: 150,
                          padding: EdgeInsets.all(sizee.width / 26),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // AspectRatio(
                              //     aspectRatio: 1 / 1,
                              //     child: Container(
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(20),
                              //         image:   DecorationImage(
                              //           image: AssetImage(allWorkoutPhoto[index].tphoto),
                              //         ),
                              //       ),
                              //     )),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: sizee.width / 2,
                                      child: Text(
                                        allWorkoutPhoto[index].descrip,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      allWorkoutPhoto[index].tname,
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: sizee.width / 8,
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              })
          : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, index) {
                return AspectRatio(
                  aspectRatio: sizee.width * 3.37 / sizee.height * 1.11,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 7, horizontal: sizee.width / 76),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(allWorkoutPhoto[index].tphoto),
                          fit: BoxFit.cover),
                    ),
                    child: InkWell(
                      onTap: () {
                        if (index == 0) {
                          context.read<WorkoutCubit>().bodyPartBack("push");
                          ind = index;
                        } else if (index == 1) {
                          context.read<WorkoutCubit>().bodyPartBack("pull");
                          ind = index;
                        } else if (index == 2) {
                          context.read<WorkoutCubit>().bodyPartBack("legs");
                          ind = index;
                        } else if (index == 3) {
                          context.read<WorkoutCubit>().bodyPartBack("triceps");
                          ind = index;
                        } else if (index == 4) {
                          context.read<WorkoutCubit>().bodyPartBack("biceps");
                          ind = index;
                        }
                      },
                      child: Card(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(33),
                        ),
                        child: Container(
                          width: 300,
                          height: 150,
                          padding: EdgeInsets.all(sizee.width / 26),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // AspectRatio(
                              //     aspectRatio: 1 / 1,
                              //     child: Container(
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(20),
                              //         image:   DecorationImage(
                              //           image: AssetImage(allWorkoutPhoto[index].tphoto),
                              //         ),
                              //       ),
                              //     )),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: sizee.width / 2,
                                      child: Text(
                                        allWorkoutPhoto[index].descrip,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      allWorkoutPhoto[index].tname,
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: sizee.width / 8,
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
    });
  }
}
