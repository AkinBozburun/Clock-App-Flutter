import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';

class CountDownPage extends StatefulWidget
{
  const CountDownPage({super.key});

  @override
  State<CountDownPage> createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage>
{

  static const maxSeconds = 10;
  int seconds = maxSeconds;
  Timer? timer;

  bool isRunning = true;

  void startTimer()
  {
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
    timer!.cancel();
    setState(()
    {
      isRunning = true;
      seconds = maxSeconds;
    });
  }

  Widget timerButton()
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
    ElevatedButton(onPressed: ()=> startTimer(), child: const Text("Başlat"));
  }

  Widget buildTimer() => SizedBox
  (
    height: 350,
    width: 350,
    child: Stack
    (
      fit: StackFit.expand,
      children:
      [
        Center
        (
          child: Text(seconds.toString(),
          style: TextStyle(color: AppStyles.lightBackGroundColor),textScaleFactor: 5),
        ),
        TweenAnimationBuilder<double>
        (
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 2000),
          builder: (context, value, _) => CircularProgressIndicator
          (
            strokeWidth: 5,
            backgroundColor: Colors.black,
            valueColor: AlwaysStoppedAnimation(AppStyles().lightBlueColor),
            value: value,
          ),
        ),
      ],
    ),
  );

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
            buildTimer(),
            timerButton(),
          ],
        ),
      ),
    );
  }
}