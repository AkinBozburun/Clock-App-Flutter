import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/alarm/add_alarm.dart';
import 'package:my_clock_app/widgets/alarm/alarm_card.dart';

class AlarmPage extends StatefulWidget
{
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage>
{
  String alarmName = "Toplantı";
  TimeOfDay time = const TimeOfDay(hour: 1, minute: 5);

  @override
  Widget build(BuildContext context)
  {
    final hours = time.hour.toString().padLeft(2,"0");
    final minutes = time.minute.toString().padLeft(2,"0");

    return Scaffold
    (
      backgroundColor: AppStyles.backGroundColor,
      appBar: AppBar
      (
        title: Text("Alarmlarım",style: AppStyles.timeTxtStyleB),
        backgroundColor: AppStyles.backGroundColor,
        elevation: 0,
        toolbarHeight: 90,
        actions: [IconButton(onPressed: () => Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddAlarm())),
        icon: const Icon(Icons.add))],
      ),
      body: ListView.builder
      (
        itemCount: 3,
        itemBuilder: (context, index) => alarmCard(alarmName,hours, minutes,context),
      ),
    );
  }
}