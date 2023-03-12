import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier
{
  int initialSeconds = 0;

  int secondsFromPicker = 0;

  convertTimeToSeconds(sec)
  {
    initialSeconds = sec;
    secondsFromPicker = initialSeconds;
    notifyListeners();
  }

  bool isRunning = true;
  Timer? timer;

  animDuration()
  {
    return Duration(milliseconds: initialSeconds*1000+500);
  }

  startTimer()
  {
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
        resetTimer();
      }
    });
  }

  pauseTimer()
  {
    if(timer!.isActive == false)
    {
      startTimer();
    }
    else
    {
      timer!.cancel();
      notifyListeners();
    }
  }

  resetTimer()
  {
    timer!.cancel();

    isRunning = true;
    initialSeconds = 0;
    notifyListeners();
  }

  String timerDurationString()
  {
    final duration = animDuration();
    String hours = duration.inHours.toString().padLeft(0, '2');
    String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }
}

class StopWatchProvider extends ChangeNotifier
{
  int minutes = 0;
  int seconds = 0;
  int miliSeconds = 0;

  bool isRunning = false;
  Timer? timer;

  String stopWatchString()
  {
    String min = minutes.toString().padLeft(2,"0");
    String sec = seconds.toString().padLeft(2,"0");
    String mili = miliSeconds.toString().padLeft(2,"0");
    return "$min.$sec.$mili";
  }

  startStopWatch()
  {
    isRunning = true;
    notifyListeners();
    timer = Timer.periodic(const Duration(milliseconds: 10), (_)
    {
      miliSeconds++;
      if(miliSeconds>99)
      {
        seconds++;
        miliSeconds = 0;
      }
      if(seconds > 59)
      {
        minutes++;
        seconds = 0;
      }
      notifyListeners();
    });
  }

  stopStopWatch()
  {
    timer!.cancel();
  }

  _resetStopWatch()
  {
    minutes = 0;
    seconds = 0;
    miliSeconds = 0;
    timer!.cancel();
    isRunning = false;
    notifyListeners();
  }

 List<Map<String,dynamic>> lapTimesList = [];
 int lapCount = 0;

  addLaps()
  {
    lapCount++;
    final lap = {"index" : lapCount,"lap": stopWatchString()};
    lapTimesList.add(lap);
  }

  clearLapTimes()
  {
    lapTimesList = [];
    lapCount = 0;
    _resetStopWatch();
    notifyListeners();
  }
}