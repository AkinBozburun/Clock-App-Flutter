import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';

class StopwatchPage extends StatefulWidget
{
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage>
{
  TimeOfDay time = const TimeOfDay(hour: 10, minute: 30);

  @override
  Widget build(BuildContext context)
  {
    final hours = time.hour.toString().padLeft(2,"0");
    final minutes = time.minute.toString().padLeft(2,"0");

    return DefaultTabController
    (
      length: 2,
      child: Scaffold
      (
        backgroundColor:  AppStyles.darkBackGroundColor,
        body: Center
        (
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Text("$hours:$minutes",style: TextStyle
              (
                color: AppStyles.lightBackGroundColor,
                fontSize: 24, fontWeight: FontWeight.bold
              )),
              const SizedBox(height: 50),
              GestureDetector
              (
                onTap:() async
                {
                  TimeOfDay? newTime = await showTimePicker(context: context, initialTime: time);

                  if(newTime == null) return;

                  setState(() => time = newTime);
                },
                child: Container
                (
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration
                  (
                    color: AppStyles().lightBlueColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow:
                    [
                      BoxShadow
                      (
                        color:AppStyles().darkShadowColor,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(2, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(child: Text("Yeni Ekle",style: TextStyle
                  (
                    color: AppStyles.darkBackGroundColor,
                    fontSize: 20,fontWeight: FontWeight.bold
                  ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}