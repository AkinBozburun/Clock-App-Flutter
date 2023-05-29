import 'package:flutter/material.dart';
import 'package:my_clock_app/styles/app_style.dart';

class EmptyMessage extends StatelessWidget
{
  const EmptyMessage({super.key});

  @override
  Widget build(BuildContext context) => Center
  (
    child: Text("Liste boş",style: AppStyles().messageStyle),
  );
}