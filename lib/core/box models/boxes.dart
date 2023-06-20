import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_clock_app/core/box%20models/alarm_model.dart';
import 'package:my_clock_app/core/box%20models/country_model.dart';

class Boxes
{
  static Box<Country> getCountryBox() => Hive.box<Country>("country");

  static Box<Alarm> getAlarmBox() => Hive.box<Alarm>("Alarm");
}