import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';

class TimePickerScrollList extends StatefulWidget
{
  const TimePickerScrollList({super.key});

  @override
  State<TimePickerScrollList> createState() => _TimePickerScrollListState();
}

class _TimePickerScrollListState extends State<TimePickerScrollList>
{

  Widget seconds(int i)
  {
    int seconds = 0;
    return Center
    (
      child: Text(i<10 ? "0${seconds+i}" : "${seconds+i}",
      style:  TextStyle(fontSize: 50,color: AppStyles.lightBackGroundColor,
      fontWeight: FontWeight.w500)),
    );
  }
  Widget minutes(int i)
  {
    int minutes = 0;
    return Center
    (
      child: Text(i<10 ? "0${minutes+i}" : "${minutes+i}",
      style:  TextStyle(fontSize: 50,color: AppStyles.lightBackGroundColor,
      fontWeight: FontWeight.w500)),
    );
  }
  Widget hours(int i)
  {
    int hours = 0;
    return Center
    (
      child: Text(i<10 ? "0${hours+i}" : "${hours+i}",
      style:  TextStyle(fontSize: 50,color: AppStyles.lightBackGroundColor,
      fontWeight: FontWeight.w500)),
    );
  }

  Widget seperator() => SizedBox(width: 40,child: Text(":", textAlign: TextAlign.center,
  style: TextStyle(fontSize: 50,color: AppStyles.lightBackGroundColor)));

  @override
  Widget build(BuildContext context)
  {
    return SizedBox
    (
      height: 250,
      child: Row
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          SizedBox //Hours picker.
          (
            width: 70,
            child: ListWheelScrollView.useDelegate
            (

              itemExtent: 90,
              diameterRatio: 1.6,
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate
              (
                childCount: 25,
                builder: (context, index)
                {
                  return hours(index);
                }
              ),
            ),
          ),
          seperator(),
          SizedBox //Minutes picker.
          (
            width: 70,
            child: ListWheelScrollView.useDelegate
            (
              itemExtent: 90,
              diameterRatio: 1.6,
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate
              (
                childCount: 60,
                builder: (context, index)
                {
                  return minutes(index);
                }
              ),
            ),
          ),
          seperator(),
          SizedBox //Seconds picker
          (
            width: 70,
            child: ListWheelScrollView.useDelegate
            (
              itemExtent: 90,
              diameterRatio: 1.6,
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate
              (
                childCount: 60,
                builder: (context, index)
                {
                  return seconds(index);
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
