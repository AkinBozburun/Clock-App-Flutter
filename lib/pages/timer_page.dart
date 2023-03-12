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
  late Animation anim;
  late AnimationController animController;

  _initAnim()
  {
    final prov = Provider.of<TimerProvider>(context,listen: false);

    animController = AnimationController(vsync: this,duration: prov.animDuration());
    anim = Tween<double>(begin: 0,end: 1).animate(animController);
  }

  Widget _timerButton()
  {
    final prov = Provider.of<TimerProvider>(context);

    return AnimatedSwitcher
    (
      duration: const Duration(milliseconds: 200),
      child:
      Row
      (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: !prov.isRunning ?
        [
          button(()=> prov.pauseTimer(animController),
            prov.timer!.isActive ? Colors.red : AppStyles.lightBackGroundColor,
            prov.timer!.isActive ?  "Duraklat" :  "Devam et"),

          button(()=> prov.resetTimer(animController),
            AppStyles.lightBlueColor,
            "Bitir"),
        ] :
        [
          button(()
          {
            _initAnim();
            prov.startTimer(animController);
          },
          AppStyles.lightBlueColor, "Başlat")
        ],
      ),
    );
  }

  _overlayCheck()
  {
    final prov = Provider.of<TimerProvider>(context);
    return AnimatedSwitcher
    (
      duration: const Duration(milliseconds: 200),
      child: !prov.isRunning ?
      TimerIndicator(anim: anim, animController: animController,
      height: 0.8.sw, width: 0.8.sw) :
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