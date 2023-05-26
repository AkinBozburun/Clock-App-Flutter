import 'package:flutter/material.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/world%20clock/country_list.dart';
import 'package:provider/provider.dart';

class SearchCountry extends StatefulWidget
{
  const SearchCountry({super.key});

  @override
  State<SearchCountry> createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry>
{
  _countryList()
  {
    final prov = Provider.of<WorldClockProvider>(context,listen: false);

    return ListView.builder
    (
      itemCount: countryList.length,
      itemBuilder: (context, index) => Padding
      (
        padding: const EdgeInsets.all(10),
        child: InkWell
        (
          borderRadius: BorderRadius.circular(20),
          onTap: ()
          {
            prov.fetchCountryHour(countryList[index]["City"]);
            Navigator.pop(context);
          },
          child: Ink
          (
            decoration: BoxDecoration
            (
              color: Colors.white10,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(5),
            child: ListTile
            (
              title: Text(countryList[index]["City"]!,style: TextStyle(color: AppStyles.softWhite,fontSize: 20)),
              subtitle: Text(countryList[index]["Country"]!,
              style: TextStyle(color: AppStyles.softWhite,fontSize: 14)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Colors.black12,
        elevation: 0,
        toolbarHeight: 80,
        title: const TextField(),
      ),
      body: _countryList(),
    );
  }
}