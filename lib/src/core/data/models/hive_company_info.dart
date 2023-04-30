import 'package:hive/hive.dart';

part 'hive_company_info.g.dart';

@HiveType(typeId: 1)
class HiveCompanyInfo {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? address;
}
