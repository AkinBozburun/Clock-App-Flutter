import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_clock_app/styles/app_style.dart';

Widget alarmCard(alarmName,hours,minutes,context)
{
  List days = ["Pzt","Sal","Çar","Per","Cum","Cts","Pzr"];
  bool switchValue = true;
  return Padding
  (
    padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
    child: InkWell
    (
      onTap: (){},
      child: Ink
      (
        height: 180,
        width: ScreenUtil().screenWidth/2,
        padding: const EdgeInsets.all(12),
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
            Align(alignment: AlignmentDirectional.topStart,child: Text(alarmName,style: AppStyles.subTxtStyle)),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [
                Text("$hours:$minutes",style: AppStyles.numberStyle),
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
      ),
    ),
  );
}