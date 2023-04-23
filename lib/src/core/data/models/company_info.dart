import 'package:hive/hive.dart';

part 'company_info.g.dart';

@HiveType(typeId: 1)
class CompanyInfo {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? address;
}
