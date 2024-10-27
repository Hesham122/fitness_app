import 'package:final_project/features/sleep/cubit/sleep_cubit.dart';
import 'package:final_project/features/sleep/cubit/sleep_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/caching/caching_helper.dart';
import '../../../core/utils/colors.dart';
import '../widgets/sleep_card.dart';
import '../widgets/sleep_stat.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {

  @override
  void initState() {
    super.initState();
    SleepCubit.get(context).initSleep();
  }

  @override
  void dispose() {
    if (SleepCubit.get(context).timer != null) {
      SleepCubit.get(context).timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SleepCubit, SleepStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SleepCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              'Sleep Tracker',
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
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime:
                              cubit.selectedSleepTime ?? TimeOfDay.now(),
                        );
                        if (pickedTime != null &&
                            pickedTime != cubit.selectedSleepTime) {
                          setState(() {
                         
                            cubit.selectedSleepTime = pickedTime;
                            CachingHelper.instance?.writeData(
                                'savedSleepTime', pickedTime.toString());
                            cubit.setSleep();
                           
                          });
                        }
                      },
                      child: SleepCard(
                        color: cubit.selectedSleepTime != null
                            ? Colorsapp.darkOrange
                            : Colorsapp.darkGrey,
                        time: cubit.selectedSleepTime != null
                            ? cubit.selectedSleepTime!.format(context)
                            : "6:00 AM",
                        label: 'Went to sleep',
                        icon: Icons.bedtime,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (picked != null) {
                          setState(() {
                            cubit.selectedAlarmTime = picked;
                            CachingHelper.instance?.writeData(
                                'savedAlarmTime', picked.toString());
                            cubit.setAlarm();
                          });
                        }
                      },
                      child: SleepCard(
                        color: cubit.selectedAlarmTime != null
                            ? Colors.teal
                            : Colorsapp.darkGrey,
                        time: cubit.selectedAlarmTime != null
                            ? cubit.selectedAlarmTime!.format(context)
                            : "No Alarm",
                        label: 'Woke up',
                        icon: Icons.alarm,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height/15),
                // Center content (Time, Alarm, Moon, and Stats)
                Center(
                  child: Column(
                    children: [
                      Text(
                        cubit.isTracking
                            ? cubit.formatDuration(
                                cubit.elapsedTime) // Show elapsed time
                            : 'Start Tracking', // Default text when not tracking
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        cubit.selectedAlarmTime == null?"No Alarm":
                        'Alarm ${cubit.selectedAlarmTime?.format(context)??""}',
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/15),
                      // Moon and Stars
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Stack(
                          alignment: Alignment.center,
                          children: [
                            // Stars
                            Positioned(
                              top: 0,
                              left: 40,
                              child: Icon(Icons.star,
                                  color: Colors.red, size: 30),
                            ),
                            Positioned(
                              top: 60,
                              left: 100,
                              child: Icon(Icons.star,
                                  color: Colors.blue, size: 30),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Icon(Icons.star,
                                  color: Colors.purple, size: 30),
                            ),
                            Positioned(
                              top: 70,
                              right: 40,
                              child: Icon(Icons.star,
                                  color: Colors.yellow, size: 30),
                            ),
                            // Moon Icon
                            Icon(Icons.brightness_3,
                                color: Colors.white, size: 100),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/15),
                      // Spacer(),
                      // Sleep stats
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          sleepStat('${cubit.elapsedTime.inMinutes} Min',
                              'Duration'),
                          sleepStat(
                              '${cubit.totalSleepHours ~/ 60} hours',
                              'Sleep Hours'),
                          sleepStat('${cubit.sleepQuality}%', 'Quality'),
                        ],
                      ),
                    ],
                  ),
                ),
                // Swipe up to Stop Tracking button
                GestureDetector(
                  onTap: () {
                    if (cubit.isTracking) {
                      cubit.stopSleepTracking(); // Stop tracking on swipe up
                    } else {
                      cubit.startSleepTracking(); // Start tracking on swipe up
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          cubit.isTracking
                              ? 'Click to Stop Tracking'
                              : 'Click to Start Tracking',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 20,),
                // const Text(
                //   "Sleep Timing",
                //   style: TextStyle(
                //     fontSize: 22,
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(height: 10),
                // Container(
                //   height: 150,
                //   padding: const EdgeInsets.all(16.0),
                //   decoration: BoxDecoration(
                //     color: Colors.deepOrange[400],
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   child: LineChart(
                //     LineChartData(
                //       gridData: const FlGridData(show: false),
                //       titlesData: const FlTitlesData(show: true),
                //       borderData: FlBorderData(show: false),
                //       lineBarsData: [
                //         LineChartBarData(
                //           spots: cubit.durations,
                //           isCurved: true,
                //           color: Colors.white,
                //           barWidth: 4,
                //           isStrokeCapRound: true,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(height: 20,),
              ],
            ),
          ),
        );
      },
    );
  }
}
