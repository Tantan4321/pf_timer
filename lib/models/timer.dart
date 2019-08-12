import 'package:flutter/material.dart';

class Timer {
  const Timer({
    @required this.name,
    @required this.time,
    @required this.color,
  });

  final Color color;
  final Duration time;
  final String name;
}
