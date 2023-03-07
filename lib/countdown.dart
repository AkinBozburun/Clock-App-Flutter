import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';

class CountDownPage extends StatefulWidget
{
  const CountDownPage({super.key});

  @override
  State<CountDownPage> createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage> with SingleTickerProviderStateMixin
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
    ElevatedButton(onPressed: ()
    {
      startTimer();
    },
    child: const Text("Başlat"));
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
          style: TextStyle(color: AppStyles.lightBackGroundColor,fontSize: 60)),
        ),
        AnimatedBuilder
        (
          animation: anim,
          builder: (context, child) => CircularProgressIndicator
          (
            strokeWidth: 5,
            backgroundColor: Colors.black,
            valueColor: AlwaysStoppedAnimation(AppStyles.lightBlueColor),
            value: anim.value,
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
        child:
        Column
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