import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockWidget extends StatelessWidget
{
  final TextStyle style;
  const ClockWidget({super.key, required this.style});

  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder
    (
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) =>
      Text(DateFormat('hh:mm:ss').format(DateTime.now()), style: style),
    );
  }
}