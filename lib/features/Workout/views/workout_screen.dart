import 'package:final_project/features/workout/cubit/workout_cubit.dart';
import 'package:final_project/features/workout/cubit/workout_states.dart';
import 'package:final_project/features/workout/widgets/workout_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutCubit, WorkoutState>(
        listener: (context, state) {},
      builder: (context, state) {
        return const WorkoutScreenBody();
      },
    );
  }
}