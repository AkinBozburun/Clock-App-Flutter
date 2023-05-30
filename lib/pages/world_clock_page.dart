import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/world%20clock/city_list.dart';
import 'package:my_clock_app/widgets/world%20clock/clock_stream.dart';
import 'package:my_clock_app/widgets/world%20clock/search_country.dart';
import 'package:provider/provider.dart';

class WorldClockPage extends StatefulWidget
{
  const WorldClockPage({super.key});

  @override
  State<WorldClockPage> createState() => _WorldClockPageState();
}

class _WorldClockPageState extends State<WorldClockPage>
{
  @override
  void initState()
  {
    if(!Hive.isBoxOpen("country"))
    {
      Provider.of<WorldClockProvider>(context,listen: false).openBoxProvider();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: AppStyles.backGroundColor,elevation: 0,
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
              color: AppStyles.softWhite),
            ),
            ListTile
            (
              title: const ClockWidget(),
              trailing: IconButton(onPressed:()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchCountry()));
              },
              icon: Icon(Icons.add,color: AppStyles.softWhite)),
            ),
          ],
        ),
      ),
      body: const CityList(),
    );
  }
}