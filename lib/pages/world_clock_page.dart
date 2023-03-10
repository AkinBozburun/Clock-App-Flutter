import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/world%20clock/city_list.dart';
import 'package:my_clock_app/widgets/world%20clock/clock_stream.dart';

class WorldClockPage extends StatefulWidget
{
  const WorldClockPage({super.key});

  @override
  State<WorldClockPage> createState() => _WorldClockPageState();
}

class _WorldClockPageState extends State<WorldClockPage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: AppStyles.darkBackGroundColor,elevation: 0,
        toolbarHeight: 310,
        title: Column
        (
          mainAxisAlignment: MainAxisAlignment.start,
          children:
          [
            Padding
            (
              padding: const EdgeInsets.all(10),
              child: Image.asset("images/world_map.png",
              color: AppStyles.lightBackGroundColor),
            ),
            ListTile
            (
              title: ClockWidget
              (
                style: TextStyle(color: AppStyles.lightBackGroundColor,fontSize: 30),
              ),
              trailing: IconButton(onPressed: (){},
              icon: Icon(Icons.add,color: AppStyles.lightBackGroundColor)),
            ),
          ],
        ),
      ),
      body: CityList(),
    );
  }
}