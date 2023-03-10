import 'package:flutter/material.dart';
import 'package:my_clock_app/widgets/stopwatch/stop_watch.dart';

class StopwatchPage extends StatefulWidget
{
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage>
{
  //TimeOfDay time = const TimeOfDay(hour: 10, minute: 30);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: Center
      (
        child: StopWatch(),
      ),
    );
  }
}