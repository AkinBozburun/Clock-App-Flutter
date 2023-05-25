import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/world clock/country_list.dart';

class CityList extends StatelessWidget
{
  const CityList({super.key});

  _timeGap(countryTime)
  {
    String time = "19";// DateFormat('HH').format(DateTime.now());
    String today = DateFormat('dd').format(DateTime.now()).toString();
    countryTime["hour"] = countryTime["hour"].substring(0,2);
    int gap = (int.parse(time) - int.parse(countryTime["hour"]));
    return gap < 0 ? "$gap saat geri" : "$gap saat ileri";
  }

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder
    (
      itemCount: countryList.length,
      itemBuilder: (context, index) => Padding
      (
        padding: const EdgeInsets.all(10),
        child: InkWell
        (
          borderRadius: BorderRadius.circular(30),
          onTap: () {},
          child: Ink
          (
            decoration: BoxDecoration
            (
              color: Colors.white12,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(10),
            child: ListTile
            (
              title: Text(countryList[index]["timezone"]!,style: TextStyle(color: AppStyles.lightBackGroundColor,fontSize: 20)),
              subtitle: Text(_timeGap(countryList[index]).toString(),
               style: TextStyle(color: AppStyles.lightBackGroundColor,fontSize: 14)),
              trailing: Text("${countryList[index]["hour"]!}:${countryList[index]["minute"]!}",
              style: TextStyle(color: AppStyles.lightBackGroundColor,fontSize: 20)),
            ),
          ),
        ),
      ),
    );
  }
}