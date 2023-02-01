import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';

class MainPage extends StatefulWidget
{
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: AppStyles.lightBackGroundColor,
      body: Center
      (
        child: Container
        (
          height: 60,
          width: 150,
          decoration: BoxDecoration
          (
            color: AppStyles().lightRedColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow:
            [
              BoxShadow
              (
                color: AppStyles().lightShadowColor,
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(2, 4), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}