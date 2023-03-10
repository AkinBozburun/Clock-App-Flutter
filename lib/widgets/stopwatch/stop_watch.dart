import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';

class StopWatch extends StatefulWidget
{
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch>
{
  int time = 0;

  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder
    (
      stream: Stream.periodic(const Duration(milliseconds: 50)),
      builder:(context, snapshot)
      {
        time++;
        return Text(time.toString(),style: TextStyle(color: AppStyles.lightBackGroundColor),textScaleFactor: 3,);
      }
    );
  }
}