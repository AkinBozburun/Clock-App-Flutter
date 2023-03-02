import "package:flutter/material.dart";
import "package:my_clock_app/styles/app_style.dart";
import "package:my_clock_app/widgets/time_picker.dart";

class TimerIndicator extends StatelessWidget
{
  final Animation anim;
  final AnimationController animController;
  final double height, width;
  const TimerIndicator({super.key, required this.anim, required this.animController,
  required this.height, required this.width});

  @override
  Widget build(BuildContext context)
  {
    return SizedBox
    (
      height: height,
      width: width,
      child: Stack
      (
        fit: StackFit.expand,
        children:
        [
          const TimePickerScrollList(),
          AnimatedBuilder
          (
            animation: anim,
            builder: (context, child) => CircularProgressIndicator
            (
              strokeWidth: 5,
              backgroundColor: Colors.black,
              valueColor: AlwaysStoppedAnimation(AppStyles().lightBlueColor),
              value: anim.value,
            ),
          ),
        ],
      ),
    );
  }
}