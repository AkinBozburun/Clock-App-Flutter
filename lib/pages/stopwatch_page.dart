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
  _stopWatchOverlay()
  {
    final prov = Provider.of<StopWatchProvider>(context);
    return Row
    (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: prov.isRunning ?
      [
        button
        (
          () => prov.timer!.isActive ? prov.stopStopWatch() : prov.startStopWatch(),
         prov.timer!.isActive ? Colors.red : AppStyles.lightBlueColor,
         prov.timer!.isActive ? "Durdur" : "Devam Et",
        ),
        button(()=> prov.timer!.isActive? prov.addLaps() : prov.clearLapTimes(),
          prov.isRunning ? AppStyles.lightBackGroundColor : Colors.white12,
          prov.timer!.isActive? "Tur" : "Sıfırla",
        ),
      ] :
      [
        button
        (
          () => prov.timer!.isActive ? prov.stopStopWatch() : prov.startStopWatch(),
         prov.timer!.isActive ? Colors.red : AppStyles.lightBlueColor,
         prov.timer!.isActive ? "Durdur" : "Başlat",
        ),
      ]
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            const StopWatchWidget(),
            const SizedBox(height: 50),
            SizedBox(height: 200.h, width: 180, child: const LapTimes()),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar
      (
        color: Colors.transparent,
        elevation: 0,
        height: 150.h,
        child: _stopWatchOverlay(),
      ),
    );
  }
}