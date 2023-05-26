import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/button.dart';
import 'package:my_clock_app/widgets/stopwatch/lap_times.dart';
import 'package:my_clock_app/widgets/stopwatch/stop_watch.dart';
import 'package:provider/provider.dart';

class StopwatchPage extends StatefulWidget
{
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage>
{
  Widget _stopWatchButtons() => Consumer<StopWatchProvider>
  (
    builder: (context, value, child) => Row
    (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: value.isRunning ?
      [
        button(() => value.timer!.isActive ? value.stopStopWatch() : value.startStopWatch(),
          value.timer!.isActive ? Colors.red : AppStyles.lightBlueColor,
          value.timer!.isActive ? "Durdur" : "Devam Et",
        ),
        button(()=> value.timer!.isActive? value.addLaps() : value.clearLapTimes(),
          AppStyles.softWhite,
          value.timer!.isActive? "Tur" : "Sıfırla",
        ),
      ] :
      [
        button(() => value.startStopWatch(), AppStyles.lightBlueColor, "Başlat"),
      ]
    ),
  );

  Widget lapsListWidget() => Consumer<StopWatchProvider>
  (
    builder:(context, value, child) => Visibility
    (
      visible: value.lapTimesList.isEmpty ? false : true,
      child: const LapTimes()
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
            const StopWatchWidget(),
            lapsListWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar
      (
        color: Colors.transparent,
        elevation: 0,
        height: 100.h,
        child: Align(alignment: Alignment.topCenter,child: _stopWatchButtons()),
      ),
    );
  }
}