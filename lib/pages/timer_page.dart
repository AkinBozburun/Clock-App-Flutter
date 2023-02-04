import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TimerPage extends StatefulWidget
{
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage>
{
  @override
  Widget build(BuildContext context)
  {
    return const Scaffold
    (
      body: Center(child: Text("timer"),),
    );
  }
}