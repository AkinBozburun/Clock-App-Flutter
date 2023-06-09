import 'package:hive/hive.dart';

part 'alarm_model.g.dart';

@HiveType(typeId: 1)
class Country
{
  @HiveField(0)
  late String hour;

  @HiveField(1)
  late String minute;

  @HiveField(2)
  late bool isActive;

  @HiveField(3)
  late List<String> days;
}