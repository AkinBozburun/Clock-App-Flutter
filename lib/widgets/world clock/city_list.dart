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

    double millis = nowSeconds - (hourGap.round()*3600000);
    var dt = DateTime.fromMillisecondsSinceEpoch(millis.toInt());
    var d24 = DateFormat("HH:mm").format(dt);
    print(d24);
    hours = d24;

    int today = int.parse(DateFormat("dd").format(DateTime.now()));
    int countryDay = int.parse(countryTime["day"]);
    String day = "";

    if(hourGap.round() == 0)
    {
      return "Aynı saat";
    }
    else
    {
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
    }
    return "${hourGap.round().abs()} saat $day";
  }

  late String hours;

  _list()
  {
    final provider = Provider.of<WorldClockProvider>(context);

    return provider.countries.isEmpty ? const Center(child: CircularProgressIndicator()) :
    ListView.builder
    (
      itemCount: provider.countries.length,
      itemBuilder: (context, index) => Padding
      (
        padding: const EdgeInsets.all(10),
        child: InkWell
        (
          borderRadius: BorderRadius.circular(30),
          onLongPress: () => provider.deleteItem(index),
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
              title: Text(provider.countries[index]["timezone"],
              style: TextStyle(color: AppStyles.softWhite,fontSize: 20)),
              subtitle: Text(_timeGap(provider.countries[index]).toString(),
              style: TextStyle(color: AppStyles.softWhite,fontSize: 14)),
              trailing: Text(hours,
              style: TextStyle(color: AppStyles.softWhite,fontSize: 20)),
            ),
          ),
        ),
      ),
    );
  }

  _countryListControl()
  {
    final prov = Provider.of<WorldClockProvider>(context,listen: false);
    if(prov.countries.isEmpty)
    {
      prov.fetchCountryHour("");
    }
  }

  @override
  void initState()
  {
    _countryListControl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _list();
}