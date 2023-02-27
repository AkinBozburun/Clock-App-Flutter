import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';

class CityList extends StatelessWidget
{
  CityList({super.key});

  final List cities = ["Italy" ,"Japan","Turkey","Germany","Norway","Egypt"];
  final List hours = ["19:00" ,"05:00","20:00","18:00","16:00","20:05"];

  @override
  Widget build(BuildContext context)
  {
      return ListView.builder
      (
        itemCount: cities.length,
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
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(10),
              child: ListTile
              (
                title: Text(cities[index],style: TextStyle(color: AppStyles.lightBackGroundColor,fontSize: 20)),
                trailing: Text(hours[index],style: TextStyle(color: AppStyles.lightBackGroundColor,fontSize: 20)),
              ),
            ),
          ),
        ),
      );
  }
}