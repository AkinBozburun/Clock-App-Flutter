import 'package:flutter/material.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/button.dart';
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
  stopWatchOverlay()
  {
    final prov = Provider.of<StopWatchProvider>(context);
    return Row
    (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: !prov.isRunning ?
      [
        button
        (
          () =>prov.startStopWatch(),
          AppStyles.lightBlueColor,
          "Başlat",
        )
      ] :
      [
        button
        (
          () =>prov.stopStopWatch(),
          Colors.red,
          "Durdur",
        ),
        button(() {}, AppStyles.lightBackGroundColor, "Tur")
      ],
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
          [
            const StopWatchWidget(),
            stopWatchOverlay(),
          ],
        ),
      ),
    );
  }
}