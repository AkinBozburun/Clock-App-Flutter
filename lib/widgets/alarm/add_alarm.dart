import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:my_clock_app/widgets/alarm/alarm_time_picker.dart';
import 'package:my_clock_app/widgets/buttons.dart';
import 'package:provider/provider.dart';

class AddAlarm extends StatefulWidget
{
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm>
{
  TextEditingController alarmNameController = TextEditingController();

  _dayPicker()
  {
    final provider = Provider.of<AlarmProvider>(context);

    return SizedBox
    (
      height: 36,
      child: GridView.builder
      (
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 40.w, mainAxisSpacing: 10, mainAxisExtent: 40),
        itemCount: 7,
        itemBuilder: (context, index) => InkWell
        (
          onTap: () => provider.pickDay(index),
          child: AnimatedContainer
          (
            width: 36,
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration
            (
              borderRadius: BorderRadius.circular(16),
              color: provider.days[index]["isSelected"] == true ?
               AppStyles.blueColor : Colors.transparent
            ),
            child: Center
            (
              child: Text(provider.days[index]["day"],
                style: provider.days[index]["isSelected"] == true ?
                AppStyles.darkTxtStyle : AppStyles.subTxtStyle),
            ),
          ),
        ),
      ),
    );
  }

  _setAlarm()
  {
    final provider = Provider.of<AlarmProvider>(context,listen: false);
    final time = DateTime.now();

    if(alarmNameController.text != "")
    {
      provider.listAlarmBox(alarmNameController.text, true, provider.hour, provider.minute);
      AndroidAlarmManager.oneShotAt
      (
        provider.parseAlarm(time.year, time.month, time.day),
        0, AlarmProvider.showAlarmNotification,
        alarmClock: true,exact: true,wakeup: true,
      )
      .then((value) => Navigator.pop(context));
    }
    else
    {
      print("alarm ismi vermelisiniz!");
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      resizeToAvoidBottomInset: false,
      body: Column
      (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [
          SizedBox(height: 20.h),
          const AlarmTimePicker(),
          Container
          (
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: ScreenUtil().screenHeight/2,
            decoration: BoxDecoration
            (
              color: AppStyles.cardColor,
              borderRadius: BorderRadius.circular(24)
            ),
            child: Column(children:
            [
              SizedBox(height: 24.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:
              [
                Text("4 GÜN",style: AppStyles.subTxtStyle),
                IconButton(onPressed: (){}, icon: Icon(Icons.calendar_month_outlined,color: AppStyles.softWhite))
              ]),
              _dayPicker(),
              TextField
              (
                controller: alarmNameController,
              ),
            ]),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
          [
            txtButton(() => Navigator.pop(context), "İptal et",AppStyles.subTxtStyle),
            txtButton(() => _setAlarm(), "Oluştur",AppStyles.subTxtStyle),
          ]),
        ],
      ),
    );
  }
}