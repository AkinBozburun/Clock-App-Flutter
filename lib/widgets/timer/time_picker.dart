import 'package:flutter/material.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:provider/provider.dart';

class TimePickerScrollList extends StatefulWidget
{
  const TimePickerScrollList({super.key});

  @override
  State<TimePickerScrollList> createState() => _TimePickerScrollListState();
}

class _TimePickerScrollListState extends State<TimePickerScrollList>
{
  final FixedExtentScrollController _hourController = FixedExtentScrollController();
  final FixedExtentScrollController _minuteController = FixedExtentScrollController();
  final FixedExtentScrollController _secondController = FixedExtentScrollController();

  _timeFormatting()
  {
    final prov = Provider.of<TimerProvider>(context,listen: false);

    int h = _hourController.selectedItem*3600;
    int m = _minuteController.selectedItem*60;
    int s = _secondController.selectedItem;
    int timeToSeconds = h+m+s;
    prov.convertTimeToSeconds(timeToSeconds);
  }

  Widget seconds(int i)
  {
    int seconds = 0;
    return Center
    (
      child: Text(i<10 ? "0${seconds+i}" : "${seconds+i}",
      style: AppStyles().numberStyle),
    );
  }
  Widget minutes(int i)
  {
    int minutes = 0;
    return Center
    (
      child: Text(i<10 ? "0${minutes+i}" : "${minutes+i}",
      style: AppStyles().numberStyle),
    );
  }
  Widget hours(int i)
  {
    int hours = 0;
    return Center
    (
      child: Text(i<10 ? "0${hours+i}" : "${hours+i}",
      style: AppStyles().numberStyle),
    );
  }

  Widget _timeSeperator() => Text(":", textAlign: TextAlign.center,
    style: AppStyles().numberStyle);

  Widget _timeBox(txt, widget)=> Column
  (
    mainAxisAlignment: MainAxisAlignment.center,
    children:
    [
      Text(txt,style: AppStyles.timeTxtStyleB),
      const SizedBox(height: 20),
      SizedBox
      (
        width: 100,
        height: 200,
        child: widget,
       ),
      const SizedBox(height: 35),
    ],
  );

  double itemExtent = 80;

  @override
  Widget build(BuildContext context)
  {
    return Row
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        _timeBox
        (
          "Saat",
          ListWheelScrollView.useDelegate
          (
            controller: _hourController,
            itemExtent: itemExtent,
            diameterRatio: 10,
            onSelectedItemChanged: (value) => _timeFormatting(),
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
        _timeSeperator(),
        _timeBox
        (
          "Dakika",
          ListWheelScrollView.useDelegate
          (
            controller: _minuteController,
            itemExtent: itemExtent,
            diameterRatio: 10,
            onSelectedItemChanged: (value) => _timeFormatting(),
            physics: const FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate
            (
              childCount: 60,
              builder: (context, index)
              {
                return minutes(index);
              }
            ),
          )),
        _timeSeperator(),
        _timeBox
        (
          "Saniye",
          ListWheelScrollView.useDelegate
          (
            controller: _secondController,
            itemExtent: itemExtent,
            diameterRatio: 10,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (value) => _timeFormatting(),
            childDelegate: ListWheelChildBuilderDelegate
            (
              childCount: 60,
              builder: (context, index)
              {
                return seconds(index);
              }
            ),
          ),
        )
      ],
    );
  }
}
