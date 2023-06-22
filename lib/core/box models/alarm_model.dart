import 'package:hive/hive.dart';

part 'alarm_model.g.dart';

@HiveType(typeId: 1)
class Alarm
{
  @HiveField(0)
  late String alarmName;

  @HiveField(1)
  late int hour;

  @HiveField(2)
  late int minute;

  @HiveField(3)
  late bool isActive;

  @HiveField(4)
  late List<Map> days;
}