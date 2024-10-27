import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final int percent;
  final Widget route;

  const ProgressItem({super.key, 
    required this.title,
    required this.subTitle,
    required this.percent,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 25.0,
                  lineWidth: 8.0,
                  animation: true,
                  percent: double.parse((percent/100).toString()),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Colors.grey[300]!,
                  progressColor: Colors.deepOrange,
                ),
                Text(
                  "$percent%",
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                ),
                Text(
                  subTitle,
                  //"Today: $lastWeekProgress%",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => route,));
              },
                child: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16)),
          ],
        ),
      ),
    );
  }
}