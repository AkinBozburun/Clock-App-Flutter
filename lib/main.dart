import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_clock_app/pages/alarm_page.dart';
import 'package:my_clock_app/pages/stopwatch_page.dart';
import 'package:my_clock_app/pages/timer_page.dart';
import 'package:my_clock_app/pages/world_clock_page.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/countdown.dart';

void main()
{
  SystemChrome.setSystemUIOverlayStyle
  (
    SystemUiOverlayStyle
    (
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppStyles.darkBackGroundColor,
      systemNavigationBarIconBrightness: Brightness.light
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: 'MyClock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData
      (
        scaffoldBackgroundColor: AppStyles.darkBackGroundColor
      ),
      home: const CountDownPage() //Tab(),
    );
  }
}

class Tab extends StatefulWidget
{
  const Tab({super.key});

  @override
  State<Tab> createState() => _TabState();
}

class _TabState extends State<Tab>
{
  @override
  Widget build(BuildContext context)
  {
    return DefaultTabController
    (
      length: 4,
      initialIndex: 2,
      child: Scaffold
      (
        body: const TabBarView
        (
          children:
          [
            AlarmPage(),
            WorldClockPage(),
            StopwatchPage(),
            TimerPage(),
          ],
        ),
        bottomNavigationBar: TabBar
        (
          labelPadding: const EdgeInsets.all(10),
          labelColor: AppStyles().lightBlueColor,
          unselectedLabelColor: AppStyles.lightBackGroundColor,
          splashBorderRadius: BorderRadius.circular(20),
          indicatorColor: Colors.transparent,
          tabs: const
          [
            Text('Alarm'),
            Text('Dünya Saati'),
            Text('Kronometre'),
            Text('Zamanlayıcı'),
          ],
        ),
      )
    );
  }
}