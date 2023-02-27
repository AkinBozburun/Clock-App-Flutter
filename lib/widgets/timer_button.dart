import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';

class TimerButton extends StatefulWidget
{
  const TimerButton({super.key});

  @override
  State<TimerButton> createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton>
{
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;

  startTimer() => timer = Timer.periodic(const Duration(seconds: 1), (_)
  {
    setState(()=>seconds--);
  });

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector
    (
      onTap:() async => startTimer(),
      //{
      //  TimeOfDay? newTime = await showTimePicker(context: context, initialTime: time);
      //  if(newTime == null) return;
      //  setState(() => time = newTime);
      //},
      child: Container
      (
        height: 60,
        width: 150,
        decoration: BoxDecoration
        (
          color: AppStyles().lightBlueColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Text("Başlat",style: TextStyle
        (
          color: AppStyles.darkBackGroundColor,
          fontSize: 20,fontWeight: FontWeight.bold
        ))),
      ),
    );
  }
}