import 'dart:async';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:final_project/core/notification/notification_service.dart';
import 'package:final_project/features/sleep/cubit/sleep_states.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/caching/caching_helper.dart';

class SleepCubit extends Cubit<SleepStates> {
  SleepCubit() : super(InitialState());

  static SleepCubit get(context) => BlocProvider.of(context);

  TimeOfDay? selectedSleepTime;
  TimeOfDay? selectedAlarmTime;

  late int totalSleepHours;
  String savedDate = '';
  String todayDate = '';

  Future<void> initSleep() async {
    todayDate = getFormattedDate(DateTime.now());
    if(CachingHelper.instance?.readString('savedDateForSleep')==null ||
    CachingHelper.instance?.readString('savedDateForSleep')== ''
    ) {
      CachingHelper.instance?.writeData('savedDateForSleep', todayDate);
    }
    savedDate = CachingHelper.instance?.readString('savedDateForSleep') ?? todayDate;
    if(savedDate == todayDate) {
      totalSleepHours = CachingHelper.instance?.readInteger('savedSleepHours') ?? 0;
    }else{
      totalSleepHours = 0;
      CachingHelper.instance?.writeData('savedDateForSleep', todayDate);
    }
    if(CachingHelper.instance?.readInteger('savedSleepQuality') == null){
      CachingHelper.instance?.writeData('savedSleepQuality', 0);
    }
    sleepQuality = CachingHelper.instance?.readInteger('savedSleepQuality')??0;
    selectedSleepTime =
        stringToTimeOfDay(CachingHelper.instance?.readString('savedSleepTime'));
    selectedAlarmTime =
        stringToTimeOfDay(CachingHelper.instance?.readString('savedAlarmTime'));
 
    startTime = emptyStartTime? DateTime.now(): DateTime.parse(
        CachingHelper.instance!.readString("SleepStartTime"));
   
   
    if (isTracking) {
      resumeSleepTracking(); // Stop tracking on swipe up
    }
  }

  // alarm alert

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
     
    } else {
     
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
    ).then((v) {
     
    });
  }

// The callback function that triggers the notification
   static void alarmCallback() async {
    await NotificationService()
        .showNotification(
      'alarm_channel',
      'Alarm',
      'Channel for Alarm Notifications',
      'Alarm',
      'Time to wake up!',
    ).then((val) {
     
    });
  }




  ///  time to sleep alert
  Future<void> setSleep() async {
    // Request permission for scheduling exact alarms
    var status = await Permission.scheduleExactAlarm.request();
    if (status.isGranted) {
      // Schedule the alarm for a specific time
      DateTime now = DateTime.now();
      DateTime alarmTime = DateTime(now.year, now.month, now.day,
          selectedSleepTime!.hour, selectedSleepTime!.minute);
      // If the selected time is in the past, schedule it for the next day
      if (alarmTime.isBefore(now)) {
        alarmTime = alarmTime.add(const Duration(days: 1));
      }
      await scheduleSleep(alarmTime);
     
    } else {
   
    }
  }

  Future<void> scheduleSleep(DateTime alarmTime) async {
    const int alarmId = 0; // You can give each alarm a unique ID
    await AndroidAlarmManager.oneShotAt(
      alarmTime,
      alarmId,
      sleepCallback,
      exact: true,
      wakeup: true,
    ).then((v) {
       
    });
  }

   static void sleepCallback() async {
    await NotificationService()
        .showNotification(
      'alarm_channel',
      'Alarm',
      'Channel for Alarm Notifications',
      'Alarm',
      'Time to sleep!',
    ).then((val) {
     
    });
  }

  TimeOfDay? stringToTimeOfDay(String? timeString) {
    if (timeString != null) {
      try {
        // Trim any leading/trailing whitespace
        timeString = timeString.trim();

        // Check if the string starts and ends with the expected format
        if (timeString.startsWith("TimeOfDay(") && timeString.endsWith(")")) {
          // Extract the content within "TimeOfDay(...)"
          timeString = timeString.substring(10, timeString.length - 1);
        } else {
          throw const FormatException("Invalid format, must be TimeOfDay(hh:mm)");
        }

        // Split the string to get hour and minute
        final timeParts = timeString.split(':');

        if (timeParts.length != 2) {
          throw const FormatException("Invalid time format, must be hh:mm");
        }

        final hour = int.parse(timeParts[0].trim()); // Extract the hour
        final minute = int.parse(timeParts[1].trim()); // Extract the minute

        // Return the TimeOfDay object
        return TimeOfDay(hour: hour, minute: minute);
      } catch (e) {
       
        return null; // Return null if input is invalid
      }
    }
    return null;
  }

  bool emptyStartTime = CachingHelper.instance?.readString("SleepStartTime")==null;
  late DateTime startTime;  // Initialized with current time
  Duration elapsedTime = const Duration();
  Timer? timer;  // Made nullable
  bool isTracking = CachingHelper.instance?.readBoolean("isTrackingSleep")??false;

  // Dummy alarm time
  String alarmTime = "07:00 AM";

  // To store quality of sleep
  int sleepQuality = 80; // This could be calculated or randomized

  List<FlSpot> durations = [];
  void addDuration()
  {
    totalSleepHours += elapsedTime.inMinutes;
   
    CachingHelper.instance?.writeData('savedSleepHours', totalSleepHours);
    int index = durations.length;
    double dur = elapsedTime.inHours.toDouble();
    //if(dur<0)dur = 0;
    durations.add(FlSpot(index+1, dur));
  }

  // Simulate sleep quality calculation (example logic)
  int calculateSleepQuality(int durationInMinutes) {
    if (durationInMinutes > 60) {
      return 90;
    } else if (durationInMinutes > 30) {
      return 80;
    } else {
      return 60;
    }
  }

  // Format Duration to a readable format
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }



  void startSleepTracking() {
    //DateTime startTime = DateTime.now();
    emit(SleepLoadingState());
      isTracking = true;
      CachingHelper.instance?.writeData("isTrackingSleep", true);
      CachingHelper.instance?.writeData("SleepStartTime", DateTime.now().toIso8601String());
      startTime = DateTime.now();
      emit(SleepStartTrackingState());
    // Timer to update the sleep duration every second
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        elapsedTime = DateTime.now().difference(startTime);
        emit(SleepIncrementTrackingState());
    });
  }

  void resumeSleepTracking() {
    emit(SleepResumeTrackingState());
    // Timer to update the sleep duration every second
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        elapsedTime = DateTime.now().difference(startTime);
        emit(SleepIncrementTrackingState());
    });
  }

  void stopSleepTracking() {
    emit(SleepLoadingState());
    if (timer != null) {
      timer!.cancel();  // Use null-aware operator
    }
      isTracking = false;
      CachingHelper.instance?.writeData("isTrackingSleep", false);
      addDuration();
      // You can also add logic here to calculate sleep quality based on _elapsedTime.
      sleepQuality = calculateSleepQuality(elapsedTime.inMinutes); // Example logic
    CachingHelper.instance?.writeData('savedSleepQuality', sleepQuality);
    emit(SleepEndTrackingState());
  }

  String getFormattedDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }
}
