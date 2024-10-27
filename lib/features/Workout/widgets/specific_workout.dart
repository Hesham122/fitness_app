import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/core/utils/caloriesadtrtime.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/share_snackbar.dart';
import 'package:final_project/core/utils/workout_photo_main.dart';
import 'package:final_project/features/authentication/cubit/auth_cubit.dart';
import 'package:final_project/features/workout/cubit/workout_cubit.dart';
import 'package:final_project/features/workout/cubit/workout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'choose_training.dart';

class SpecificWorkout extends StatefulWidget {
  final int ind;

  const SpecificWorkout({super.key, required this.ind});

  @override
  State<SpecificWorkout> createState() => _SpecificWorkoutState();
}

class _SpecificWorkoutState extends State<SpecificWorkout> {
  List<bool> isFavoriteList = []; // List to hold favorite states for workouts

  @override
  void initState() {
    super.initState();
    isFavoriteList = List<bool>.filled(
        100, false); // Initialize with a size; update dynamically in builder
  }

  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colorsapp.secondarycolor,
      appBar: AppBar(
        elevation: 0,
        title: Text("${allWorkoutPhoto[widget.ind].tname} WORKOUT",),
        foregroundColor: Colors.white,
        backgroundColor: Colorsapp.secondarycolor,
      ),
      body: BlocConsumer<WorkoutCubit, WorkoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is WorkoutSuccessful) {
            // Resize the list based on actual workouts count
            if (isFavoriteList.length != state.workouts.length) {
              isFavoriteList = List<bool>.filled(state.workouts.length, false);
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  // const SizedBox(height: 12),
                  // Center(
                  //   child: Text(
                  //     "${allWorkoutPhoto[widget.ind].tname} WORKOUT",
                  //     style: const TextStyle(color: Colors.white, fontSize: 30),
                  //   ),
                  // ),
                  // const Center(
                  //   child: Text(
                  //     "START TRAINING",
                  //     style: TextStyle(color: Colors.white, fontSize: 15),
                  //   ),
                  // ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.workouts.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => ChooseTraining(
                                trainInd: widget.ind,
                                traincalory: allWorkoutTimeAndcalory[widget.ind]
                                        [index]
                                    .tCalory,
                                trainTime: allWorkoutTimeAndcalory[widget.ind]
                                        [index]
                                    .tTime,
                                ind: index,
                                pic: state.workouts[index].gifUrl,
                                isfavorite: isFavoriteList[index],
                                cal: allWorkoutTimeAndcalory[widget.ind][index].tCalory.toDouble(),
                              ),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.grey[900],
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(33),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            padding: EdgeInsets.all(sizee.width / 26),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 1.8 / 1.8,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            state.workouts[index].gifUrl),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Equipment: ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colorsapp.darkOrange,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        state.workouts[index].equipment,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colorsapp.darkOrange,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        state.workouts[index].bodyPart,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                //SizedBox(width: sizee.width / 8),
                                IconButton(
                                  onPressed: () async {
                                    String image =
                                        state.workouts[index].gifUrl;
                                    String eq =
                                        state.workouts[index].equipment;
                                    String exname =
                                        state.workouts[index].bodyPart;
                                    String indexx = widget.ind.toString();

                                    // Check if the item already exists in Firestore
                                    QuerySnapshot querySnapshot =
                                        await AuthCubit.get(context)
                                            .checkIfExists(
                                      image: image,
                                      eq: eq,
                                      exname: exname,
                                      indexx: indexx,
                                    );

                                    bool isCurrentlyFavorite =
                                        querySnapshot.docs.isNotEmpty;

                                    if (!isCurrentlyFavorite) {
                                      // Item doesn't exist, so add it
                                      // ignore: use_build_context_synchronously
                                      await AuthCubit.get(context).addData(
                                        image: image,
                                        eq: eq,
                                        exname: exname,
                                        indexx: indexx,
                                      );
                                      // ignore: use_build_context_synchronously
                                      snackbarshare(context,
                                          "Exercise added to favorites.");

                                      setState(() {
                                        isFavoriteList[index] =
                                            true; // Set to true for this index
                                      });
                                    } else {
                                      // Item exists, so remove it
                                      // ignore: use_build_context_synchronously
                                      await AuthCubit.get(context).removeData(
                                        image: image,
                                        eq: eq,
                                        exname: exname,
                                        indexx: indexx,
                                      );
                                      // ignore: use_build_context_synchronously
                                      snackbarshare(context,
                                          "Exercise removed from favorites.");

                                      setState(() {
                                        isFavoriteList[index] =
                                            false; // Set to false for this index
                                      });
                                    }
                                  },
                                  icon: isFavoriteList[index]
                                      ? Icon(
                                          size: 30,
                                          Icons.favorite,
                                          color: Colors
                                              .deepOrange[700], // Toggle color based on state
                                        )
                                      : const Icon(
                                    size: 30,
                                          Icons.favorite_border_outlined,
                                          color: Colors
                                              .white, // Toggle color based on state
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return const Text(""); // In case of other states
        },
      ),
    );
  }
}
