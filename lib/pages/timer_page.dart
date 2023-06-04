import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/button.dart';
import 'package:my_clock_app/widgets/timer/time_picker.dart';
import 'package:my_clock_app/widgets/timer/timer_indicator.dart';
import 'package:provider/provider.dart';

class TimerPage extends StatefulWidget
{
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with TickerProviderStateMixin
{
  Widget _timerButton() => Consumer<TimerProvider>
  (
    builder:(context, value, child) => AnimatedSwitcher
    (
      duration: const Duration(milliseconds: 200),
      child:
      Row
      (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: !value.isRunning ?
        [
          button(()=> value.pauseTimer(),
            value.timer!.isActive ? Colors.red : AppStyles.softWhite,
            value.timer!.isActive ?  "Duraklat" :  "Devam et"),
          button(()=> value.resetTimer(),
            AppStyles.blueColor,
            "Bitir"),
        ] :
        [
          button(()
          {
            if(value.initialSeconds != 0)
            {
              value.startTimer();
            }
          },
            AppStyles.blueColor, "Başlat")
        ],
      ),
    ),
  );

  _overlayCheck()
  {
    final prov = Provider.of<TimerProvider>(context);
    return AnimatedSwitcher
    (
      duration: const Duration(milliseconds: 200),
      child: !prov.isRunning ?
      TimerIndicator(height: 0.8.sw, width: 0.8.sw) :
      const TimePickerScrollList()
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: Center
      (
        child: _overlayCheck(),
      ),
      bottomNavigationBar: BottomAppBar
      (
        color: Colors.transparent,
        elevation: 0,
        height: 150.h,
        child: _timerButton(),
      ),
    );
  }
}