import 'dart:async';
import 'dart:convert';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:my_clock_app/core/box%20models/alarm_model.dart';
import 'package:my_clock_app/core/box%20models/boxes.dart';
import 'package:my_clock_app/core/box%20models/country_model.dart';
import 'package:my_clock_app/core/notification/notification_service.dart';
import 'package:my_clock_app/widgets/world%20clock/country_list.dart';

class AlarmProvider extends ChangeNotifier
{
  int hour = 0;
  int minute = 0;

  parseAlarm(year,month,day)
  {
    String mn = month < 10 ? "0$month" : month.toString();
    String d = day < 10 ? "0$day" : day.toString();
    String h = hour < 10 ? "0$hour" : hour.toString();
    String m = minute < 10 ? "0$minute" : minute.toString();
    String dateTxt = "$year-$mn-$d $h:$m:00";

    return DateTime.parse(dateTxt);
  }

  @pragma('vm:entry-point')
  static void showAlarmNotification()
  {
    NotificationService.showNotification(title: "Alarm", body: "Alarm çalıyor!",
    category: NotificationCategory.Alarm,actionType: ActionType.KeepOnTop,
    actionButtons: [NotificationActionButton(key: "stopAlarm", label: "Durdur")]);
  }

  List<Map> days =
  [
    {"day": "Pzt", "isSelected" : false},
    {"day": "Sal", "isSelected" : false},
    {"day": "Çar", "isSelected" : false},
    {"day": "Per", "isSelected" : false},
    {"day": "Cum", "isSelected" : false},
    {"day": "Cts", "isSelected" : false},
    {"day": "Paz", "isSelected" : false},
  ];

  pickDay(index)
  {
    days[index]["isSelected"] = !days[index]["isSelected"];
    notifyListeners();
  }

  List alarmBoxList = [];

  setBoxToList()
  {
    alarmBoxList = Boxes.getAlarmBox().values.toList().cast<Alarm>();
    print("box listeye geçti");
  }

  listAlarmBox(alarmName,isActive,hour,minute)
  {
    String h = hour < 10 ? "0$hour" : hour.toString();
    String m = minute < 10 ? "0$minute" : minute.toString();

    final box = Boxes.getAlarmBox();
    var con = Alarm()
    ..alarmName = alarmName
    ..hour = h
    ..minute = m
    ..isActive = isActive
    ..days = days;

    box.put(alarmName,con);

    setBoxToList();
    notifyListeners();
  }

  openBoxProvider() async
  {
    if(!Hive.isBoxOpen("Alarm"))
    {
      await Hive.openBox<Alarm>("Alarm");
      notifyListeners();
      print("Alarm box açıldı");
    }
    setBoxToList();
  }

  deleteItemInBox(index)
  {
    Boxes.getAlarmBox().delete(index);
    setBoxToList();
    notifyListeners();
  }
}

class WorldClockProvider extends ChangeNotifier
{
  late Map result;

  fetchCountryHour(city,int index, context) async
  {
    String clockApi = "https://api.api-ninjas.com/v1/worldtime?city=$city";

    await http.get
    (
      Uri.parse(clockApi),
      headers: {'X-Api-Key': "M48RZ8Qc+fsU3eHxKx5MVA==mx1ELdox8rXqqYhX"}
    ).then((value)
    {
      result = jsonDecode(value.body);
      _listBox(result,index);
    }).then((value) => Navigator.pop(context));
  }
  _listBox(result,index)
  {
    result["timezone"] = countryList[index]["City"];

    final box = Boxes.getCountryBox();
    var con = Country()
    ..country = result["timezone"]
    ..timeGap = setTimeInfo(1,result)
    ..result = result;

    box.put(result["timezone"], con);

    setBoxToList();
    notifyListeners();

    print("fetched!");
  }

  setTimeInfo(mode,countryTime)
  {
    DateTime now = DateTime.now();
    DateTime country = DateTime.parse(countryTime["datetime"]);
    int nowMilliSeconds= now.millisecondsSinceEpoch;
    int countryMilliSeconds= country.millisecondsSinceEpoch;
    double hourGap = (nowMilliSeconds-countryMilliSeconds)/3600000;

    double millisToHour = nowMilliSeconds - (hourGap.round()*3600000);
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(millisToHour.toInt());

    int today = int.parse(DateFormat("dd").format(DateTime.now()));
    int thisMonth = int.parse(DateFormat("M").format(DateTime.now()));

    int countryDay = int.parse(countryTime["day"]);
    int countryMonth = int.parse(countryTime["month"]);
    String countryHour = DateFormat("HH:mm").format(dt);

    String day = "";
    String gapInfo = "";

    if(hourGap.round() == 0)
    {
      gapInfo = "Aynı saat";
    }
    else
    {
      if(countryDay > today || countryMonth > thisMonth)
      {
        day = "ileri, yarın";
      }
      else
      {
        day = "geri, dün";
      }
      if(countryDay == today  && countryMilliSeconds > nowMilliSeconds)
      {
        day = "ileri";
      }
      if(countryDay == today && countryMilliSeconds < nowMilliSeconds)
      {
        day = "geri";
      }
      gapInfo = "${hourGap.round().abs()} saat $day";
    }

    return mode == 1 ? gapInfo : countryHour;
  }

  List cBoxList = [];

  openBoxProvider() async
  {
    if(!Hive.isBoxOpen("country"))
    {
      await Hive.openBox<Country>("country");
      notifyListeners();
      print("World Clock box açıldı");
    }
    setBoxToList();
  }

  deleteItemInBox(index)
  {
    Hive.box<Country>("country").delete(index);
    setBoxToList();
    notifyListeners();
  }

  setBoxToList()
  {
    cBoxList = Boxes.getCountryBox().values.toList().cast<Country>();
    print("box listeye geçti");
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
        NotificationService.showNotification
        (
          title: "Zamanlayıcı.", body: "Zamanlayıcı sona erdi."
        );
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