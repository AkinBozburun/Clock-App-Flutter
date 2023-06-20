import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/alarm/add_alarm.dart';
import 'package:my_clock_app/widgets/alarm/alarm_card.dart';
import 'package:my_clock_app/widgets/empty_message.dart';
import 'package:provider/provider.dart';

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

  _alarmList()
  {
    final provider = Provider.of<AlarmProvider>(context);
    if(Hive.isBoxOpen("Alarm"))
    {
      return provider.alarmBoxList.isEmpty ? const EmptyMessage(txt: "Liste boş") :
      ListView.builder
      (
        itemCount: provider.alarmBoxList.length,
        itemBuilder: (context, index) => alarmCard
        (
          provider.alarmBoxList[index].alarmName,hours, minutes,context
        ),
      );
    }
    else
    {
      provider.openBoxProvider();
      return Center(child: CircularProgressIndicator
      (
        color: AppStyles.softWhite,
      ));
    }
  }

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
        actions: [IconButton(onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AddAlarm())),
        icon: const Icon(Icons.add))],
      ),
      body:
    );
  }
}