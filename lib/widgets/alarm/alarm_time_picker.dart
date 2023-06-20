import 'package:flutter/material.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:provider/provider.dart';

class AlarmTimePicker extends StatefulWidget
{
  const AlarmTimePicker({super.key});

  @override
  State<AlarmTimePicker> createState() => _AlarmTimePickerState();
}

class _AlarmTimePickerState extends State<AlarmTimePicker>
{
  final FixedExtentScrollController _hourController = FixedExtentScrollController(initialItem: DateTime.now().hour);
  final FixedExtentScrollController _minuteController = FixedExtentScrollController(initialItem: DateTime.now().minute);

  _pickAlarm(int? hourValue, int? minuteValue)
  {
    final provider = Provider.of<AlarmProvider>(context,listen: false);

    if(hourValue == null) provider.minute = minuteValue!;
    if(minuteValue == null) provider.hour = hourValue!;
  }

  Widget hours(int i)
  {
    int hours = 0;
    return Center
    (
      child: Text(i<10 ? "0${hours+i}" : "${hours+i}",
      style: AppStyles.numberStyle),
    );
  }
  Widget minutes(int i)
  {
    int minutes = 0;
    return Center
    (
      child: Text(i<10 ? "0${minutes+i}" : "${minutes+i}",
      style: AppStyles.numberStyle),
    );
  }

  Widget _timeSeperator() => Text(":", textAlign: TextAlign.center,
    style: AppStyles.numberStyle);

  Widget _timeBox(widget)=> SizedBox
  (
    width: 100,
    height: 200,
    child: widget,
  );

  double itemExtent = 80;

  _initAlarm()
  {
    final provider = Provider.of<AlarmProvider>(context,listen: false);
    provider.hour = _hourController.initialItem;
    provider.minute = _minuteController.initialItem;
  }

  @override
  void initState()
  {
    _initAlarm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Row
  (
    mainAxisAlignment: MainAxisAlignment.center,
    children:
    [
      _timeBox
      (
        ListWheelScrollView.useDelegate
        (
          controller: _hourController,
          itemExtent: itemExtent,
          diameterRatio: 2,
          onSelectedItemChanged: (value)
          {
            _pickAlarm(value,null);
          },
          physics: const FixedExtentScrollPhysics(),
          childDelegate: ListWheelChildBuilderDelegate
          (
            childCount: 24,
            builder: (context, index) => hours(index),
          ),
        ),
      ),
      _timeSeperator(),
      _timeBox
      (
        ListWheelScrollView.useDelegate
        (
          controller: _minuteController,
          itemExtent: itemExtent,
          diameterRatio: 2,
          onSelectedItemChanged: (value) => _pickAlarm(null, value),
          physics: const FixedExtentScrollPhysics(),
          childDelegate: ListWheelChildBuilderDelegate
          (
            childCount: 60,
            builder: (context, index) => minutes(index)
          ),
        )
      ),
    ],
  );
}
