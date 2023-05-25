import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/pages/alarm_page.dart';
import 'package:my_clock_app/pages/stopwatch_page.dart';
import 'package:my_clock_app/pages/timer_page.dart';
import 'package:my_clock_app/pages/world_clock_page.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider
    (
      providers:
      [
        ChangeNotifierProvider(create: (context) => TimerProvider()),
        ChangeNotifierProvider(create: (context) => StopWatchProvider()),
        ChangeNotifierProvider(create: (context) => WorldClockProvider()),
      ],
      child: ScreenUtilInit
      (
        designSize: const Size(360, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) =>  MaterialApp
        (
          title: 'MyClock',
          debugShowCheckedModeBanner: false,
          theme: ThemeData
          (
            scaffoldBackgroundColor: AppStyles.darkBackGroundColor
          ),
          home: const Tab(),
        ),
      ),
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
  Widget tabTxt(txt) => Text(txt,);

  @override
  Widget build(BuildContext context)
  {
    return DefaultTabController
    (
      length: 4,
      initialIndex: 3,
      child: Scaffold
      (
        body: const TabBarView
        (
          physics: NeverScrollableScrollPhysics(),
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
          labelColor: AppStyles.lightBlueColor,
          labelStyle: AppStyles().tabTxtStyle,
          unselectedLabelColor: AppStyles.lightBackGroundColor,
          splashBorderRadius: BorderRadius.circular(20),
          indicatorColor: Colors.transparent,
          tabs:
          [
            tabTxt("Alarm"),
            tabTxt('Dünya Saati'),
            tabTxt('Kronometre'),
            tabTxt('Zamanlayıcı'),
          ],
        ),
      )
    );
  }
}