import 'package:flutter/material.dart';

class WorldClockPage extends StatefulWidget
{
  const WorldClockPage({super.key});

  @override
  State<WorldClockPage> createState() => _WorldClockPageState();
}

class _WorldClockPageState extends State<WorldClockPage>
{
  @override
  Widget build(BuildContext context)
  {
    return const Scaffold
    (
      body: Center(child: Text("Dünya Saati")),
    );
  }
}