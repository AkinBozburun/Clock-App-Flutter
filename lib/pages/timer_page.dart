import 'package:flutter/material.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/widgets/time_picker.dart';
import 'package:my_clock_app/widgets/timer_indicator.dart';
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
          ElevatedButton(onPressed: ()=> prov.pauseTimer(animController),
          child: Text(prov.timer!.isActive ?  "Duraklat" :  "Devam et")),
          ElevatedButton(onPressed: ()=> prov.resetTimer(animController),
          child: const Text("Bitir"))
        ] :
        [
          ElevatedButton(onPressed: ()
          {
            _initAnim();
            prov.startTimer(animController);
          },
          child: const Text("Başlat")),
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
      height: 350,width: 350) :
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
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
          [
            _overlayCheck(),
            _timerButton(),
          ],
        ),
      ),
    );
  }
}