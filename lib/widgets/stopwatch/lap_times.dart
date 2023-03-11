import 'package:flutter/material.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:provider/provider.dart';

class LapTimes extends StatefulWidget
{
  const LapTimes({super.key});

  @override
  State<LapTimes> createState() => _LapTimesState();
}

class _LapTimesState extends State<LapTimes>
{

  _lapTimesListView()
  {
    final prov = Provider.of<StopWatchProvider>(context);
    return ListView.builder
    (
      itemCount: prov.lapTimesList.length,
      itemBuilder: (context, index) => ListTile
      (
        title: Text(prov.lapTimesList[index]["lap"],style: AppStyles().timeTxtStyle),
        leading: Text(prov.lapTimesList[index]["index"].toString(),style: AppStyles().timeTxtStyle),
      ),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return _lapTimesListView();
  }
}