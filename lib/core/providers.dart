import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier
{
  int initialSeconds = 0;
  convertTimeToSeconds(sec)
  {
    initialSeconds = sec;
    notifyListeners();
  }

  bool isRunning = true;
  Timer? timer;

  animDuration()
  {
    return Duration(milliseconds: initialSeconds*1000+500);
  }

  startTimer(animController)
  {
    animController.forward();
    isRunning = false;
    notifyListeners();
    timer = Timer.periodic(const Duration(seconds: 1),(_)
    {
      if(initialSeconds > 0)
      {
        initialSeconds--;
        notifyListeners();
      }
      else
      {
        resetTimer(animController);
      }
    });
  }

  pauseTimer(animController)
  {
    animController.stop();
    if(timer!.isActive == false)
    {
      startTimer(animController);
    }
    else
    {
      timer!.cancel();
      notifyListeners();
    }
  }

  resetTimer(animController)
  {
    animController.reset();
    timer!.cancel();

    isRunning = true;
    initialSeconds = 0;
    notifyListeners();
    print(isRunning);
  }

  String formatDuration()
  {
    final duration = animDuration();
    String hours = duration.inHours.toString().padLeft(0, '2');
    String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

}