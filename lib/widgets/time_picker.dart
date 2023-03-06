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
      style: TextStyle(fontSize: 50,color: AppStyles.lightBackGroundColor,
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

  Widget _timeSeperator() => SizedBox(width: 40,child: Text(":", textAlign: TextAlign.center,
  style: TextStyle(fontSize: 50,color: AppStyles.lightBackGroundColor)));

  Widget timeTxt(String txt) => SizedBox
  (
    width: 100,
    child: Center(child: Text(txt,style: AppStyles().txtStyle)),
  );

  @override
  Widget build(BuildContext context)
  {
    return Column
    (
      children:
      [
        Row
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            timeTxt("Saat"),
            const SizedBox(width: 20),
            timeTxt("Dakika"),
            const SizedBox(width: 20),
            timeTxt("Saniye"),
          ],
        ),
        const SizedBox(height: 30),
        SizedBox
        (
          height: 240,
          child: Row
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              SizedBox //Hours picker.
              (
                width: 80,
                child: ListWheelScrollView.useDelegate
                (
                  controller: _hourController,
                  itemExtent: 100,
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
              SizedBox //Minutes picker.
              (
                width: 80,
                child: ListWheelScrollView.useDelegate
                (
                  controller: _minuteController,
                  itemExtent: 100,
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
                ),
              ),
              _timeSeperator(),
              SizedBox //Seconds picker
              (
                width: 80,
                child: ListWheelScrollView.useDelegate
                (
                  controller: _secondController,
                  itemExtent: 100,
                  diameterRatio: 10,
                  physics: const FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (value)
                  {
                    _timeFormatting();
                  },
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
        ),
      ],
    );
  }
}
