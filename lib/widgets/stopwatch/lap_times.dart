import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_clock_app/core/providers.dart';
import 'package:my_clock_app/styles/app_style.dart';
import 'package:provider/provider.dart';

class LapTimes extends StatefulWidget
{
  const LapTimes({super.key});

  @override
  State<LapTimes> createState() => _LapTimesState();
}

class _LapTimesState extends State<LapTimes>
{
  _lapTimesListView() => Consumer<StopWatchProvider>
  (
    builder:(context, value, child) => SizedBox
    (
      height: 200.h,
      width: 175.w,
      child: ListView.builder
      (
        itemCount: value.lapTimesList.length,
        itemBuilder: (context, index) => SizedBox(height: 50,
        child: Row
        (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          [
            Text("${value.lapTimesList[index]["index"]}.",style: AppStyles.timeTxtStyleN),
            Text(value.lapTimesList[index]["lap"],style: AppStyles.timeTxtStyleN),
          ],
        )),
      ),
    ),
  );

  @override
  Widget build(BuildContext context)
  {
    return Padding
    (
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column
      (
        children:
        [
          SizedBox(width: 195.w,
            child: Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [
                Text("Tur",style: AppStyles.timeTxtStyleB),
                Text("Tur Süresi",style: AppStyles.timeTxtStyleB),
              ],
            ),
          ),
          Padding
          (
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Container(height: 1,color: AppStyles.softWhite),
          ),
          _lapTimesListView(),
        ],
      ),
    );
  }
}