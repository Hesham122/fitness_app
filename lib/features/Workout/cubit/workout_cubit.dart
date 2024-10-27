import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:dio/dio.dart';
import 'package:final_project/features/workout/cubit/workout_states.dart';
import 'package:final_project/features/workout/model/api_endpoint.dart';
import 'package:final_project/features/workout/model/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/caching/caching_helper.dart';
import '../../../core/notification/notification_service.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(WorkoutInitState());
  static WorkoutCubit get(context) => BlocProvider.of(context);

  WorkoutModel? wk;
  String sss = '';
  bodyPartBack(String exName) async {
    try {
      String api = Endpoint.baseUrl;
      final option = Options(headers: {
        "x-rapidapi-host": "exercisedb.p.rapidapi.com",
        "x-rapidapi-key": "554a02e03dmshd886ff48681c04dp19af10jsna2f57238ab4d",
      });
      emit(WorkoutLoading());
      final response = await Dio()
          .get("$api/name/$exName?offset=0&limit=10", options: option);
      List<dynamic> responseData = response.data;
      List<WorkoutModel> workouts =
          responseData.map((item) => WorkoutModel.fromJson(item)).toList();
      emit(WorkoutSuccessful(workouts: workouts));

      return workouts;
    } on Exception catch (e) {
      emit(WorkoutError(errorMessage: e.toString()));
    }
  }

  TimeOfDay? selectedAlarmTime;

  double workoutCal = 0;
  String savedDate = '';
  String todayDate = '';

  Future<void> initWorkout() async {
    todayDate = getFormattedDate(DateTime.now());
    if (CachingHelper.instance?.readString('savedDateForWorkout') == null ||
        CachingHelper.instance?.readString('savedDateForWorkout') == '') {
      CachingHelper.instance?.writeData('savedDateForWorkout', todayDate);
    }
    savedDate =
        CachingHelper.instance?.readString('savedDateForWorkout') ?? todayDate;
    if (savedDate == todayDate) {
      workoutCal = CachingHelper.instance?.readDouble('workoutCalories') ?? 0;
    } else {
      workoutCal = 0;
      CachingHelper.instance?.writeData('savedDateForWorkout', todayDate);
    }
  }

  Future<void> setAlarm() async {
    // Request permission for scheduling exact alarms
    var status = await Permission.scheduleExactAlarm.request();
    if (status.isGranted) {
      // Schedule the alarm for a specific time
      DateTime now = DateTime.now();
      DateTime alarmTime = DateTime(now.year, now.month, now.day,
          selectedAlarmTime!.hour, selectedAlarmTime!.minute);
      // If the selected time is in the past, schedule it for the next day
      if (alarmTime.isBefore(now)) {
        alarmTime = alarmTime.add(const Duration(days: 1));
      }
      await scheduleAlarm(alarmTime);
    }
  }

  Future<void> scheduleAlarm(DateTime alarmTime) async {
    const int alarmId = 0; // You can give each alarm a unique ID
    await AndroidAlarmManager.oneShotAt(
      alarmTime,
      alarmId,
      alarmCallback,
      exact: true,
      wakeup: true,
    ).then((v) {});
  }

// The callback function that triggers the notification
  static void alarmCallback() async {
    await NotificationService()
        .showNotification(
          'workout_channel',
          'Workout',
          'Channel for Workout Notifications',
          'Alarm',
          'Time to workout!',
        )
        .then((val) {});
  }

  String getFormattedDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }
}
