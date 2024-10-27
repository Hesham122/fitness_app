import 'package:final_project/features/Workout/views/schudual_calender.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_workoutview.dart';

class WorkoutScreenBody extends StatefulWidget {
  const WorkoutScreenBody({super.key});

  @override
  State<WorkoutScreenBody> createState() => _WorkoutScreenBodyState();
}

class _WorkoutScreenBodyState extends State<WorkoutScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Workout',
            style: TextStyle(color: Colors.white),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.white,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SchudualCalendar()));
                },
                icon: const Icon(Icons.date_range,color: Colors.white,size: 30,))
          ],
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              //TopDesign(),
              CustomWorkoutview()
            ],
          ),
        ));
  }
}
