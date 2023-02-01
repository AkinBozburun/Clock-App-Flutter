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
  bool theme = true;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: theme ? AppStyles.lightBackGroundColor : AppStyles.darkBackGroundColor,
      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            GestureDetector
            (
              onTap:()=> setState(() => theme = !theme),
              child: Container
              (
                height: 60,
                width: 150,
                decoration: BoxDecoration
                (
                  color: theme ? AppStyles().lightRedColor : AppStyles().darkBlueColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow:
                  [
                    BoxShadow
                    (
                      color: theme ? AppStyles().lightShadowColor : AppStyles().darkShadowColor,
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(2, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(child: Text("Yeni Ekle",style: TextStyle
                (
                  color: theme ? AppStyles.lightBackGroundColor : AppStyles.darkBackGroundColor,
                  fontSize: 20,fontWeight: FontWeight.bold
                ))),
              ),
            ),
            const SizedBox(height: 50),
            Text("Hello World",style: TextStyle
            (
              color: theme ? AppStyles.darkBackGroundColor : AppStyles.lightBackGroundColor,
              fontSize: 24, fontWeight: FontWeight.bold
            )),
          ],
        ),
      ),
    );
  }
}