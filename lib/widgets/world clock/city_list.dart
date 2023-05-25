import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:provider/provider.dart';

class CityList extends StatefulWidget
{
  const CityList({super.key});

  @override
  State<CityList> createState() => _CityListState();
}

class _CityListState extends State<CityList>
{
  _timeGap(countryTime)
  {
    DateTime now = DateTime.now();
    DateTime country = DateTime.parse(countryTime["datetime"]);
    int nowSeconds= now.millisecondsSinceEpoch;
    int countrySeconds= country.millisecondsSinceEpoch;
    double hourGap = (nowSeconds-countrySeconds)/3600000;

    int today = int.parse(DateFormat("dd").format(DateTime.now()));
    int countryDay = int.parse(countryTime["day"]);

    String day = "";
    if(countryDay > today)
    {
      day = "ileri, yarın";
    }
    else
    {
      day = "geri, dün";
    }
    if(countryDay == today && countrySeconds > nowSeconds)
    {
      day = "ileri";
    }
    if(countryDay == today && countrySeconds < nowSeconds)
    {
      day = "geri";
    }
    return "${hourGap.round().abs()} saat $day";
  }

  _list()
  {
    List countryList = Provider.of<WorldClockProvider>(context).countries;

    return countryList.isEmpty ? const Center(child: CircularProgressIndicator()) :
    ListView.builder
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
              title: Text(countryList[index]["timezone"],style: TextStyle(color: AppStyles.lightBackGroundColor,fontSize: 20)),
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

  @override
  void initState()
  {
    Provider.of<WorldClockProvider>(context,listen: false).fetchCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _list();
}