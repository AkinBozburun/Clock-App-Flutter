import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_clock_app/core/box%20models/country_model.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/world%20clock/city_list.dart';
import 'package:my_clock_app/widgets/world%20clock/clock_stream.dart';
import 'package:my_clock_app/widgets/world%20clock/search_country.dart';

class WorldClockPage extends StatefulWidget
{
  const WorldClockPage({super.key});

  @override
  State<WorldClockPage> createState() => _WorldClockPageState();
}

class _WorldClockPageState extends State<WorldClockPage>
{
  @override
  void dispose()
  {
    Hive.box<Country>("country").close();
    super.dispose();
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