import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/stop_watch.dart';
import 'package:my_clock_app/widgets/timer_button.dart';

class StopwatchPage extends StatefulWidget
{
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage>
{
  TimeOfDay time = const TimeOfDay(hour: 10, minute: 30);

  @override
  Widget build(BuildContext context)
  {
    final hours = time.hour.toString().padLeft(2,"0");
    final minutes = time.minute.toString().padLeft(2,"0");

    return DefaultTabController
    (
      length: 2,
      child: Scaffold
      (
        backgroundColor:  AppStyles.darkBackGroundColor,
        body: Center
        (
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const
            [
              StopWatch(),
              SizedBox(height: 50),
              TimerButton(),
            ],
          ),
        ),
      ),
    );
  }
}