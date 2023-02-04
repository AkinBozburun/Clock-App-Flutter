import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_clock_app/pages/alarm_page.dart';
import 'package:my_clock_app/pages/stopwatch_page.dart';
import 'package:my_clock_app/pages/timer_page.dart';
import 'package:my_clock_app/pages/world_clock_page.dart';
import 'package:my_clock_app/styles/app_style.dart';
void main()
{
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
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppStyles.lightBackGroundColor
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
        appBar: AppBar
        (
          systemOverlayStyle: const SystemUiOverlayStyle
          (
            statusBarIconBrightness: Brightness.dark,statusBarColor: Colors.transparent
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: TabBar
          (
            labelColor: AppStyles().lightRedColor,
            unselectedLabelColor: AppStyles.darkBackGroundColor,
            tabs: const
            [
              Text('Alarm'),
              Text('Dünya Saati',textAlign: TextAlign.center),
              Text('Kronometre',textAlign: TextAlign.center),
              Text('Zamanlayıcı',textAlign: TextAlign.center),
            ],
          ),
          //title: PreferredSize
          //(
          //  preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          //  child: Container
          //  (
          //    height: 60,
          //    padding: const EdgeInsets.symmetric
          //    (
          //      horizontal: 20,
          //      vertical: 5,
          //    ),
          //    child: Container
          //    (
          //      decoration: BoxDecoration
          //      (
          //        borderRadius: BorderRadius.circular(20),
          //        color: Colors.grey.shade300,
          //      ),
          //      child: TabBar
          //      (
          //        labelColor: AppStyles.lightBackGroundColor,
          //        unselectedLabelColor: AppStyles.darkBackGroundColor,
          //        indicator: BoxDecoration
          //        (
          //          borderRadius: BorderRadius.circular(20),
          //          color: AppStyles().lightRedColor,
          //        ),
          //        tabs: const
          //        [
          //          Text('Alarm'),
          //          Text('Dünya Saati'),
          //          Text('Kronometre'),
          //          Text('Zamanlayıcı'),
          //        ],
          //      ),
          //    ),
          //  ),
          //),
        ),
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
      )
    );
  }
}