import 'package:final_project/core/utils/caloriesadtrtime.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/workout/cubit/workout_states.dart';
import 'package:final_project/features/workout/cubit/workout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_training_pic.dart';
import 'loading_bar.dart';

// ignore: must_be_immutable
class ChooseTraining extends StatefulWidget {
  bool isfavorite;
  int trainTime;
  int traincalory;
  String pic;
  int ind;
  int trainInd;
  double cal;
   ChooseTraining({
    super.key,
    required this.pic,
    required this.ind,
    required this.trainTime,
    required this.traincalory,
    required this.trainInd,
    required this.isfavorite,
    required this.cal,
  });

  @override
  State<ChooseTraining> createState() => _ChooseTrainingState();
}

// List<Widget> widgetPages = [
//   // HomeView(),
//   // TimerView(), // Assuming you have a TimerView widget
//   // CaloriesView(), // Assuming you have a CaloriesView widget
//   // ProfileView(), // Assuming you have a ProfileView widget
// ];

class _ChooseTrainingState extends State<ChooseTraining> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colorsapp.secondarycolor,
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            CustomTrainingPic(
              pic: widget.pic,
              isfavorite: widget.isfavorite,
            ),
            const SizedBox(
              height: 11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  height: 160,
                  width: sizee.width / 2.2,
                  // margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 22),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(33)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Calories",
                            style: TextStyle(fontSize: 17),
                          ),
                          Icon(Icons.local_fire_department)
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                          width: 150,
                          child: Text(
                            widget.traincalory.toString(),
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Kcal",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  height: 160,
                  width: sizee.width / 2.2,
                  // margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 22),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(33)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TrainingTime",
                            style: TextStyle(fontSize: 17),
                          ),
                          Icon(
                            Icons.timer,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                          width: 150,
                          child: Text(
                            widget.trainTime.toString(),
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "min",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            // Container(
            //   height: 70,
            //   width: 70,
            //   decoration: const BoxDecoration(
            //     color: Colors.amberAccent,
            //     shape: BoxShape.circle
            //   ),
            //   child: TextButton(onPressed: () {}, child: const Text("data"))),
            // ElevatedButton(
            //     onPressed: () {},
            //     style: ButtonStyle(
            //         backgroundColor:
            //             WidgetStatePropertyAll(Colorsapp.darkOrange),
            //         padding: const WidgetStatePropertyAll(
            //             EdgeInsets.symmetric(vertical: 20, horizontal: 50))),
            //     child: const Text("Start"))
          ],
        ),
      ),

      floatingActionButton: Container(
        width: 85,
        height: 85,
        margin: const EdgeInsets.only(top: 45),
        child: FloatingActionButton(
          backgroundColor: Colorsapp.darkOrange,
          autofocus: true,
          isExtended: true,
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoadingBar(
                          trainTime: widget.trainTime,
                          pic: widget.pic,
                      cal: widget.cal,
                        )));
          },
          child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Text(
                "Start",
                style: TextStyle(color: Colorsapp.secondarycolor, fontSize: 20),
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          BlocBuilder<WorkoutCubit, WorkoutState>(builder: (context, state) {
        return state is WorkoutSuccessful
            ? ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22)),
                child: BottomAppBar(
                  child: SizedBox(
                    height: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            _onItemTapped(0);
                            widget.ind--;
                            widget.pic = state.workouts[widget.ind].gifUrl;
                            widget.traincalory =
                                allWorkoutTimeAndcalory[widget.trainInd]
                                        [widget.ind]
                                    .tCalory;
                            widget.trainTime =
                                allWorkoutTimeAndcalory[widget.trainInd]
                                        [widget.ind]
                                    .tTime;
                          },
                          child: Icon(
                            size: 40,
                            Icons.navigate_before,
                            color: _selectedIndex == 0
                                ? Colorsapp.darkOrange
                                : Colorsapp.secondarycolor,
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            _onItemTapped(3);
                            widget.ind++;
                            widget.pic = state.workouts[widget.ind].gifUrl;
                            widget.traincalory =
                                allWorkoutTimeAndcalory[widget.trainInd]
                                        [widget.ind]
                                    .tCalory;
                            widget.trainTime =
                                allWorkoutTimeAndcalory[widget.trainInd]
                                        [widget.ind]
                                    .tTime;
                          },
                          child: Icon(
                            size: 40,
                            Icons.navigate_next,
                            color: _selectedIndex == 3
                                ? Colorsapp.darkOrange
                                : Colorsapp.secondarycolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Container();
      }),
    );
  }
}
