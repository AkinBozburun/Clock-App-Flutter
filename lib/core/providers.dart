import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:my_clock_app/core/box%20models/boxes.dart';
import 'package:my_clock_app/core/box%20models/country_model.dart';
import 'package:my_clock_app/widgets/world%20clock/country_list.dart';

class WorldClockProvider extends ChangeNotifier
{
  List countries = [];

  fetchCountryHour(city,int index) async
  {
    String clockApi = "https://api.api-ninjas.com/v1/worldtime?city=$city";

    if(city != "")
    {
      await http.get
      (
        Uri.parse(clockApi),
        headers: {'X-Api-Key': "M48RZ8Qc+fsU3eHxKx5MVA==mx1ELdox8rXqqYhX"}
      ).then((value)
      {
        Map result = jsonDecode(value.body);
        //_listItems(result,index);
        _listBox(result,index);
        _timeGap(result);
      });
    }
    else
    {print("city boş");}
  }
  _listItems(result,index)
  {
    int i = 0;

    result["timezone"] = countryList[index]["City"];
    //countries.add(result);
    notifyListeners();
    print("fetched!");
  }
  _listBox(result,index)
  {
    int i = 0;

    result["timezone"] = countryList[index]["City"];


    var box = Hive.box<Country>("country");
    var con = Country()
    ..country = result["timezone"]
    ..time = hours
    ..timeGap = timeGapInfo;

    box.put(i++, con);

    print(box.length);

  }
  deleteItem(index)
  {
    //countries.removeAt(index);
    notifyListeners();
  }

  String timeGapInfo = "";
  String hours = "";

  _timeGap(countryTime)
  {
    DateTime now = DateTime.now();
    DateTime country = DateTime.parse(countryTime["datetime"]);
    int nowSeconds= now.millisecondsSinceEpoch;
    int countrySeconds= country.millisecondsSinceEpoch;
    double hourGap = (nowSeconds-countrySeconds)/3600000;

    double millis = nowSeconds - (hourGap.round()*3600000);
    var dt = DateTime.fromMillisecondsSinceEpoch(millis.toInt());
    var d24 = DateFormat("HH:mm").format(dt);
    hours = d24;
    notifyListeners();

    int today = int.parse(DateFormat("dd").format(DateTime.now()));
    int countryDay = int.parse(countryTime["day"]);
    String day = "";

    if(hourGap.round() == 0)
    {
      return "Aynı saat";
    }
    else
    {
      if(countryDay > today)
      {
        day = "ileri, yarın";
      }
      else
      {
        day = "geri, dün";
      }
      if(countryDay == today && countrySeconds > nowSeconds)
      {
        day = "ileri";
      }
      if(countryDay == today && countrySeconds < nowSeconds)
      {
        day = "geri";
      }
    }
    timeGapInfo = "${hourGap.round().abs()} saat $day";
    notifyListeners();
    //return "${hourGap.round().abs()} saat $day";
  }

  //addBox(i)
  //{
  //  //final provider = Provider.of<WorldClockProvider>(context,listen: false);
//
  //  var box = Hive.box<Country>("country");
  //  var con = Country()
  //  ..country = provider.countries[i]["timezone"]
  //  ..time = hours
  //  ..timeGap = _timeGap(provider.countries[i]);
//
  //  box.put(i, con);
  //  provider.setBoxToList();
  //}

  List cBoxList = [];

  openBoxProvider() async
  {
    await Hive.openBox<Country>("country");
    print("box açıldı");
    setBoxToList();
  }
  setBoxToList()
  {
    if(Hive.isBoxOpen("country"))
    {
      cBoxList = Boxes.getCountryBox().values.toList().cast<Country>();
    }
    notifyListeners();
  }
  clearBoxprovider()
  {
    Hive.box<Country>("country").clear();
    cBoxList = [];
    notifyListeners();
  }
}

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
    return Duration(milliseconds: initialSeconds*1000);
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