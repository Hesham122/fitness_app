import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:final_project/core/caching/caching_helper.dart';
import 'package:final_project/core/notification/notification_service.dart';
import 'package:final_project/features/water/cubit/water_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class WaterCubit extends Cubit<WaterStates> {
  WaterCubit() : super(InitialState());

  static WaterCubit get(context) => BlocProvider.of(context);

  late int totalWater; // current water intake
  int waterGoal = 8;  // daily goal
  late double progress;

  TimeOfDay? selectedReminderTime;
  String savedDate = '';
  String todayDate = '';

  void initWater(){
    todayDate = getFormattedDate(DateTime.now());
    if(CachingHelper.instance?.readString('savedDateForWater')==null ||
    CachingHelper.instance?.readString('savedDateForWater')== ''
    ) {
      CachingHelper.instance?.writeData('savedDateForWater', todayDate);
      //print(CachingHelper.instance?.readString('savedDateForWater'));
    }
    savedDate = CachingHelper.instance?.readString('savedDateForWater') ?? todayDate;
    if(savedDate == todayDate) {
      totalWater = CachingHelper.instance?.readInteger('savedDrunkWater') ?? 0;
    }else{
      totalWater = 0;
      CachingHelper.instance?.writeData('savedDateForWater', todayDate);
    }
    progress = totalWater / waterGoal;
    selectedReminderTime =
        stringToTimeOfDay(CachingHelper.instance?.readString('savedWaterReminderTime'));
    emit(WaterLoadingState());
  }

  void addWater(double amount) {
    totalWater += 1;
    progress = totalWater / waterGoal;
    CachingHelper.instance?.writeData('savedDrunkWater', totalWater);
   
    if(totalWater == 8){
      sendNotification();
    }
    emit(AddWaterSuccessState());
  }

  Future<void> setAlarm() async {
    // Request permission for scheduling exact alarms
    var status = await Permission.scheduleExactAlarm.request();
    if (status.isGranted) {
      // Schedule the alarm for a specific time
      DateTime now = DateTime.now();
      DateTime alarmTime = DateTime(now.year, now.month, now.day,
          selectedReminderTime!.hour, selectedReminderTime!.minute);
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
      'water_channel',
      'You reaches',
      'Channel for Water Notifications',
      'Water',
      'Reminder to drink a glass of water!',
    ).then((val) {
     
    });
  }

  Future<void> sendNotification() async {
    await NotificationService()
        .showNotification(
      'water_channel',
      'You reaches',
      'Channel for Water Notifications',
      'Water',
      'You drunk 8 glasses of Water today👏',
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

  String getFormattedDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }
}
