import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

    if(Hive.isBoxOpen("country"))
    {
      return provider.cBoxList.isEmpty ? const EmptyMessage(txt: "Liste boş") :
      ListView.builder
      (
        itemCount: provider.cBoxList.length,
        itemBuilder: (context, index) => Padding
        (
          padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
          child: InkWell
          (
            borderRadius: BorderRadius.circular(20),
            onLongPress: () => provider.deleteItemInBox(provider.cBoxList[index].country),
            child: Ink
            (
              decoration: BoxDecoration
              (
                color: Colors.white12,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.only(left: 10,right: 10,top: 15.h,bottom: 15.h),
              child: ListTile
              (
                title: Text(provider.cBoxList[index].country,
                style: AppStyles.timeTxtStyleB),
                subtitle: Text(provider.cBoxList[index].timeGap,
                style: AppStyles.subTxtStyle),
                trailing: Text(provider.setTimeInfo(0, provider.cBoxList[index].result),
                style: AppStyles.timeTxtStyleB),
              ),
            ),
          ),
        ),
      );
    }
    else
    {
      provider.openBoxProvider();
      return Center(child: CircularProgressIndicator
      (
        color: AppStyles.softWhite,
      ));
    }
  }

  @override
  Widget build(BuildContext context) => _list();
}