import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_clock_app/styles/app_style.dart';

class ScreenSize extends StatelessWidget
{
  const ScreenSize({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: Center
      (
        child: Column(mainAxisAlignment: MainAxisAlignment.center,children:
        [
          Text("Height: ${ScreenUtil().screenHeight}",style: AppStyles().numberStyle),
          Text("Width: ${ScreenUtil().screenWidth}",style: AppStyles().numberStyle),
        ]),
      ),
    );
  }
}