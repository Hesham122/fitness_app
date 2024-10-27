import 'package:final_project/features/workout/model/workout_model.dart';

abstract class WorkoutState {}

class WorkoutInitState extends WorkoutState {}

class WorkoutSuccessful extends WorkoutState {
final List<WorkoutModel> workouts;
  WorkoutSuccessful({required this.workouts});
}

class WorkoutError extends WorkoutState {
  String? errorMessage;
  WorkoutError({this.errorMessage});
}

class WorkoutLoading extends WorkoutState {}
