import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_clock_app/widgets/time_picker.dart';
import 'package:my_clock_app/widgets/timer_indicator.dart';

class TimerPage extends StatefulWidget
{
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with SingleTickerProviderStateMixin
{
  late Animation anim;
  late AnimationController animController;

  static const maxSeconds = 20;
  int seconds = maxSeconds;
  Timer? timer;

  bool isRunning = true;

  @override
  void initState()
  {
    super.initState();
    animController = AnimationController(vsync: this,duration: const Duration(seconds: maxSeconds));
    anim = Tween<double>(begin: 0,end: 1).animate(animController);
  }

  void startTimer()
  {
    animController.forward();
    isRunning = false;
    timer = Timer.periodic(const Duration(seconds: 1), (_)
    {
      if(seconds > 0)
      {
        setState(() => seconds--);
      }
      else
      {
        resetTimer();
      }
    });
  }

  void pauseTimer()
  {
    animController.stop();
    if(timer!.isActive == false)
    {
      startTimer();
    }
    else
    {
      setState(()
      {
        timer!.cancel();
      });
    }
  }

  void resetTimer()
  {
    animController.reset();
    timer!.cancel();
    setState(()
    {
      isRunning = true;
      seconds = maxSeconds;
    });
  }

  Widget _timerButton()
  {
    return !isRunning ?
    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:
    [
      ElevatedButton(onPressed: ()=> pauseTimer(),
      child: Text(timer!.isActive ?  "Duraklat" :  "Devam et")),
      ElevatedButton(onPressed: ()=> resetTimer(), child: const Text("Bitir"))
    ])
    :
    ElevatedButton(onPressed: ()
    {
      startTimer();
    },
    child: const Text("Başlat"));
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
          [
            const TimePickerScrollList(),
            //TimerIndicator(anim: anim, animController: animController,
            //height: 400,width: 400),
            _timerButton(),
          ],
        ),
      ),
    );
  }
}