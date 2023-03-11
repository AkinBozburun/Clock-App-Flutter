import 'package:flutter/material.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:provider/provider.dart';

class StopWatchWidget extends StatefulWidget
{
  const StopWatchWidget({super.key});

  @override
  State<StopWatchWidget> createState() => _StopWatchWidgetState();
}

class _StopWatchWidgetState extends State<StopWatchWidget>
{

  @override
  Widget build(BuildContext context)
  {
    return Consumer<StopWatchProvider>
    (
      builder: (context, value, child) => Text(value.stopWatchString(),
      style: AppStyles().numberStyle, textScaleFactor: 1.2),
    );
  }
}