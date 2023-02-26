import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';

Widget alarmCard(hours,minutes,context)
{
  List days = ["P","S","Ç","P","C","C","P"];
  bool switchValue = true;
  return Container
  (
    height: 210,
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration
    (
      color: AppStyles.darkBackGroundColor,
      borderRadius: BorderRadius.circular(16),
      boxShadow:
      [
        BoxShadow
        (
          color: AppStyles().darkShadowColor,
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(1, 1),
        ),
      ],
    ),
    child: Column
    (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
      [
        Row
        (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          [
            Text("$hours:$minutes",style: TextStyle
            (
              color: AppStyles.lightBackGroundColor,
              fontSize: 50, fontWeight: FontWeight.bold,
            )),
            CupertinoSwitch(activeColor:
            AppStyles().lightBlueColor,value: switchValue, onChanged: (value) {}),
          ],
        ),
        SizedBox
        (
          height: 40,
          child: GridView.builder
          (
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 40,
            mainAxisSpacing: 15,mainAxisExtent: 40),
            itemCount: 7,
            itemBuilder: (context, index) => Column
            (
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
              [
                Text(days[index],style: TextStyle(color: AppStyles.lightBackGroundColor)),
                const SizedBox(height: 10),
                Container
                (
                  height: 6,
                  decoration: BoxDecoration(shape: BoxShape.circle,
                  color: AppStyles().lightBlueColor)
                ),
              ],
            ),
          ),
        ),
        Text("HER GÜN",style: TextStyle(color: AppStyles.lightBackGroundColor)),
      ],
    ),
  );
}