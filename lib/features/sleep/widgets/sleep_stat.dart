import 'package:flutter/material.dart';

Widget sleepStat(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label,
            style: const TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.normal)),
      ],
    );
  }