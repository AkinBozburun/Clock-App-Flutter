import "package:flutter/material.dart";
import "package:my_clock_app/core/providers.dart";
import "package:my_clock_app/styles/app_style.dart";
import "package:provider/provider.dart";

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
          Consumer<TimerProvider>(builder: (context, value, child) =>
          Center(child: Text(value.timerDurationString(),
          style: AppStyles().numberStyle))),
          AnimatedBuilder
          (
            animation: anim,
            builder: (context, child) => CircularProgressIndicator
            (
              strokeWidth: 8,
              backgroundColor: Colors.black,
              valueColor: AlwaysStoppedAnimation(AppStyles.lightBlueColor),
              value: anim.value,
            ),
          ),
        ],
      ),
    );
  }
}