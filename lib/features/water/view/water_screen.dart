import 'package:final_project/features/water/cubit/water_cubit.dart';
import 'package:final_project/features/water/cubit/water_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/caching/caching_helper.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WaterScreenState createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  @override
  void initState() {
    super.initState();
    WaterCubit.get(context).initWater();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WaterCubit, WaterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = WaterCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              'Water Tracker',
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
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'STAY HYDRATED, DRINK WATER',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Current water intake display
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Set reminder to drink water',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    cubit.selectedReminderTime != null
                                      ? cubit.selectedReminderTime!.format(context)
                                      : "No Reminder",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue),
                                  ),
                                  const Text('1gl water', style: TextStyle(fontSize: 16, color: Colors.grey),),
                                  const SizedBox(height: 20,),
                                  GestureDetector(
                                onTap: () async {
                                    final TimeOfDay? picked = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    if (picked != null) {
                                      setState(() {
                                        cubit.selectedReminderTime = picked;
                                        CachingHelper.instance?.writeData(
                                            'savedWaterReminderTime',
                                            picked.toString());
                                        cubit.setAlarm();
                                      });
                                    }
                                  },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: MediaQuery.of(context).size.height / 18,
                                  decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                      ),
                                  child: const Center(
                                    child: Text(
                                      'Add reminder',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                                ],
                              ),
                              const Spacer(),
                              Icon(FontAwesomeIcons.glassWaterDroplet, color: Colors.blue.shade200, size: 100,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Circular progress indicator for daily water goal
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: CircularProgressIndicator(
                            value: cubit.progress,
                            strokeWidth: 12,
                            //color: Colors.white,
                            backgroundColor: Colors.blue.shade100,
                            valueColor:
                                const AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.water_drop,
                              size: 70,
                              color: Colors.white,
                            ),
                            Text(
                              '${cubit.totalWater.toInt()}gl',
                              style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'of ${cubit.waterGoal.toInt()} glasses',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Add water button
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.addWater(200); // adds 200ml
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding:
                              const EdgeInsets.symmetric(horizontal: 0, vertical: 25),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add a glass',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              FontAwesomeIcons.glassWater,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Daily goal status
                  Center(
                    child: Text(
                      'You got ${((cubit.totalWater / cubit.waterGoal) * 100).toInt()}% of today\'s goal. Keep it up!',
                      style: const TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
