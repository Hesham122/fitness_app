import 'dart:async';
import 'package:final_project/core/caching/caching_helper.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomProgresstrain extends StatefulWidget {
  final int trainTime;
  final String pic;
  final double cal;
  const CustomProgresstrain(
      {super.key, required this.pic, required this.trainTime, required this.cal});

  @override
  _CustomProgresstrainState createState() => _CustomProgresstrainState();
}

class _CustomProgresstrainState extends State<CustomProgresstrain> {
  bool isRun = false;
  late Duration duration;
  Duration reverseDuration = const Duration(seconds: 0);
  Timer? repeated;
  bool isrestart = false;
  int completed = 0;
  double percentage = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startcount();
    duration = Duration(minutes: widget.trainTime);
  }

  startcount() {
    isRun = true;
    repeated = Timer.periodic(const Duration(seconds: 1), (timer) {
      int newsec = duration.inSeconds - 1;
      int revsec = reverseDuration.inSeconds + 1;
      setState(() {
        if (newsec <= 0) {
          timer.cancel();
          isrestart = true;
          CachingHelper.instance?.writeData("workoutCalories", widget.cal.toDouble());
        }
        Duration dd = Duration(minutes: widget.trainTime);
        if (revsec >= dd.inSeconds) {
          timer.cancel();
          isrestart = true;
        }
        duration = Duration(seconds: newsec);
        reverseDuration = Duration(seconds: revsec);
        // elapsedDuration += Duration(seconds: 1);
        percentage = (reverseDuration.inSeconds / dd.inSeconds) * 100;
        // if (newsec >= 0 && newsec <= dd.inSeconds / 6) {
        //   completed = 100;
        // } else if (newsec >= dd.inSeconds / 6 && newsec <= dd.inSeconds / 3) {
        //   completed = 83;
        // } else if (newsec >= dd.inSeconds / 3 && newsec <= dd.inSeconds / 2) {
        //   completed = 66;
        // } else if (newsec >= dd.inSeconds / 2 && newsec <= dd.inSeconds / .0025) {
        //   completed = 50;
        // } else if (newsec >= dd.inSeconds / .0025 && newsec <= dd.inSeconds / 1.2) {
        //   completed = 33;
        // } else if (newsec >= dd.inSeconds / 1.2 && newsec <= dd.inSeconds) {
        //   completed = 16;
        // }
      });
    });
  }

  void resetTimer() {
    if (repeated != null) {
      repeated!.cancel();
    }
    setState(() {
      duration = Duration(minutes: widget.trainTime);
      reverseDuration = const Duration(seconds: 0);
    });
    startcount();
  }

  @override
  Widget build(BuildContext context) {
    Duration dd = Duration(minutes: widget.trainTime);
    int totalSeconds = dd.inSeconds;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.fitness_center, color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AspectRatio(
              aspectRatio: 1.8 / 1.8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(widget.pic), fit: BoxFit.fill),
                ),
              )),

          // Timer and progress section
          isRun
              ? Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Timer display
                        Text(
                          "${duration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${duration.inSeconds.remainder(60).toString().padLeft(2, "0")}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Progress indicators (total time, completed percentage)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${reverseDuration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${reverseDuration.inSeconds.remainder(60).toString().padLeft(2, "0")}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                  const Text(
                                    "TOTAL TIME",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              LinearPercentIndicator(
                                // animation: true,
                                width: MediaQuery.of(context).size.width / 1.9,
                                lineHeight: 4.0,
                                percent: duration.inSeconds / totalSeconds,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.deepOrange,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${double.parse(percentage.toStringAsFixed(2))}%",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                  const Text(
                                    "COMPLETED",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Pause/Play button and navigation
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  if (isrestart) {
                                    resetTimer();
                                    isrestart = false;
                                  } else if (repeated!.isActive) {
                                    setState(() {
                                      repeated!.cancel();
                                    });
                                  } else {
                                    startcount();
                                  }
                                },
                                backgroundColor: Colors.deepOrange[400],
                                child: Icon(
                                  isrestart
                                      ? Icons.restart_alt
                                      : (repeated!.isActive
                                          ? Icons.pause
                                          : Icons.play_arrow),
                                  color: Colors.white,
                                ),
                              ),
                              !isrestart
                                  ? const SizedBox(
                                      width: 30,
                                    )
                                  : Container(),
                              !isrestart
                                  ? FloatingActionButton(
                                      onPressed: () {
                                        resetTimer();
                                      },
                                      backgroundColor: Colors.deepOrange[400],
                                      child: const Icon(
                                        Icons.restart_alt,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          // : ElevatedButton(
          //     onPressed: () {
          //       startcount();
          //       isRun = true;
          //     },
          //     style: ButtonStyle(
          //         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(11)))),
          //     child: const Text(
          //       "Start",
          //       style: TextStyle(fontSize: 27),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
