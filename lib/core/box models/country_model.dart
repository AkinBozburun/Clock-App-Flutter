import 'package:hive/hive.dart';

part 'country_model.g.dart';

@HiveType(typeId: 0)
class Country
{
  @HiveField(0)
  late String country;

  @HiveField(1)
  late String timeGap;

  @HiveField(2)
  late String time;
}