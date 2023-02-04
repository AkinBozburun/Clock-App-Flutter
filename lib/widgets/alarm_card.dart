import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';

Widget alarmCard(hours,minutes,context)
{
  bool switchValue = true;
  return Container
  (
    height: 210,
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration
    (
      color: AppStyles.lightBackGroundColor,
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
              color: AppStyles.darkBackGroundColor,
              fontSize: 50, fontWeight: FontWeight.bold
            )),
            CupertinoSwitch(activeColor: AppStyles().lightRedColor,value: switchValue, onChanged: (value) {}),
          ],
        ),
        SizedBox
        (
          height: 100,
          width: MediaQuery.of(context).size.width*0.95,
          child: GridView.builder
          (
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7,
            childAspectRatio: 2/3),
            itemCount: 7,
            itemBuilder: (context, index) => Column
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                const Text("Paz"),
                Container
                (
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(shape: BoxShape.circle,
                  color: Colors.red)
                ),
              ],
            ),
          ),
        ),
        const Text("HER GÜN"),
      ],
    ),
  );
}