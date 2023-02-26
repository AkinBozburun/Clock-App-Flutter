import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_clock_app/pages/alarm_page.dart';
import 'package:my_clock_app/pages/stopwatch_page.dart';
import 'package:my_clock_app/pages/timer_page.dart';
import 'package:my_clock_app/pages/world_clock_page.dart';
import 'package:my_clock_app/styles/app_style.dart';
void main()
{
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppStyles.darkBackGroundColor
    ));

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
      home: const Tab(),
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
      initialIndex: 0,
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
        bottomNavigationBar:Container
        (
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration
          (
            borderRadius: BorderRadius.circular(20),
          ),
          child: TabBar
          (
            labelPadding: const EdgeInsets.all(10),
            labelColor: AppStyles.darkBackGroundColor,
            unselectedLabelColor: AppStyles.lightBackGroundColor,
            indicator: BoxDecoration
            (
              borderRadius: BorderRadius.circular(20),
              color: AppStyles().lightBlueColor,
            ),
            tabs:  const
            [
              Text('Alarm'),
              Text('Dünya Saati'),
              Text('Kronometre'),
              Text('Zamanlayıcı'),
            ],
          ),
        ),
      )
    );
  }
}