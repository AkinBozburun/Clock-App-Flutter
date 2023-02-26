import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';

class CityList extends StatelessWidget
{
  CityList({super.key});

  List cities = ["Roma" ,"Tokyo","Istanbul"];
  List hours = ["19:00" ,"05:00","20:00"];

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder
    (
      itemCount: cities.length,
      itemBuilder: (context, index) => ListTile
      (
        title: Text(cities[index],style: TextStyle(color: AppStyles.lightBackGroundColor,fontSize: 20)),
        trailing: Text(hours[index],style: TextStyle(color: AppStyles.lightBackGroundColor,fontSize: 20)),
      ),
    );
  }
}