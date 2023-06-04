import 'package:flutter/cupertino.dart';
import 'package:my_clock_app/styles/app_style.dart';

Widget alarmCard(hours,minutes,context)
{
  List days = ["Pzt","Sal","Çar","Per","Cum","Cts","Pzr"];
  bool switchValue = true;
  return Container
  (
    height: 180,
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
    decoration: BoxDecoration
    (
      color: AppStyles.cardColor,
      borderRadius: BorderRadius.circular(20),
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
            Text("$hours:$minutes",style: AppStyles().numberStyle),
            CupertinoSwitch(activeColor: AppStyles.blueColor,
            trackColor: AppStyles.backGroundColor,
            value: switchValue, onChanged: (value){}),
          ],
        ),
        SizedBox
        (
          height: 28,
          child: GridView.builder
          (
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 40,
            mainAxisSpacing: 5, mainAxisExtent: 40),
            itemCount: 7,
            itemBuilder: (context, index) => Column
            (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [
                Text(days[index],style: AppStyles.subTxtStyle),
                Container
                (
                  height: 4,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: AppStyles.blueColor)
                ),
              ],
            ),
          ),
        ),
        Text("HER GÜN",style: AppStyles.subTxtStyle),
      ],
    ),
  );
}