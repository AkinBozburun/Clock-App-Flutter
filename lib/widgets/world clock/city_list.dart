import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:my_clock_app/core/box%20models/country_model.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/empty_message.dart';
import 'package:provider/provider.dart';

class CityList extends StatefulWidget
{
  const CityList({super.key});

  @override
  State<CityList> createState() => _CityListState();
}

class _CityListState extends State<CityList>
{
  _list()
  {
    final provider = Provider.of<WorldClockProvider>(context);

    return provider.countries.isEmpty ? const EmptyMessage() :
    ListView.builder
    (
      itemCount: provider.countries.length,
      itemBuilder: (context, index) => Padding
      (
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
        child: InkWell
        (
          borderRadius: BorderRadius.circular(20),
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
              title: Text("",//provider.countries[index]["timezone"],
              style: TextStyle(color: AppStyles.softWhite,fontSize: 20)),
              subtitle: Text("",
              style: TextStyle(color: AppStyles.softWhite,fontSize: 14)),
              trailing: Text("",
              style: TextStyle(color: AppStyles.softWhite,fontSize: 20)),
            ),
          ),
        ),
      ),
    );
  }

  //_countryListControl()
  //{
  //  final prov = Provider.of<WorldClockProvider>(context,listen: false);
  //  if(prov.countries.isEmpty)
  //  {
  //    prov.fetchCountryHour("",null);
  //  }
  //}

  @override
  void initState()
  {
    //_countryListControl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _list();
}