import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/city_list.dart';
import 'package:my_clock_app/widgets/clock_stream.dart';

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
    //final fullWidth = MediaQuery.of(context).size.width;
    final fullHeight = MediaQuery.of(context).size.height;

    return  Column
    (
      mainAxisAlignment: MainAxisAlignment.start,
      children:
      [
        const SizedBox(height: 30),
        Padding
        (
          padding: const EdgeInsets.all(10),
          child: Image.asset("images/world_map.png",
          color: AppStyles.lightBackGroundColor),
        ),
        AppBar
        (
          backgroundColor: Colors.transparent,elevation: 0,
          title: ClockWidget(style: TextStyle
          (
            color: AppStyles.lightBackGroundColor,fontSize: 35
          )),
          centerTitle: true,
          actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.add))],
        ),
        SizedBox
        (
          height: fullHeight*0.4,
          child: CityList(),
        )
      ],
    );
  }
}