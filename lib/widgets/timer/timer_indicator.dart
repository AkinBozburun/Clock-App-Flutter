import "package:flutter/material.dart";
import "package:my_clock_app/core/providers.dart";
import "package:my_clock_app/styles/app_style.dart";
import "package:provider/provider.dart";

class TimerIndicator extends StatelessWidget
{
  final double height, width;
  const TimerIndicator({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) => SizedBox
  (
    height: height,
    width: width,
    child: Consumer<TimerProvider>(builder: (context, value, child) => Stack
    (
      fit: StackFit.expand,
      children:
      [
        Center(child: Text(value.timerDurationString(),
        style: AppStyles.numberStyle)),
        CircularProgressIndicator
        (
          strokeWidth: 6,
          backgroundColor: Colors.black,
          valueColor: AlwaysStoppedAnimation(AppStyles.blueColor),
          value: value.initialSeconds / value.secondsFromPicker,
        ),
      ],
    )),
  );
}