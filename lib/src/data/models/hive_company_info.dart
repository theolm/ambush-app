import 'package:hive/hive.dart';
import 'package:ambush_app/src/domain/models/comp_info.dart';

part 'hive_company_info.g.dart';

@HiveType(typeId: 1)
class HiveCompanyInfo extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String address;

  @HiveField(2)
  String email;

  HiveCompanyInfo(this.name, this.address, this.email);

  factory HiveCompanyInfo.fromDataModel(CompanyInfo data) =>
      HiveCompanyInfo(data.name, data.address, data.email);

  CompanyInfo toDataModel() =>
      CompanyInfo(name, address, email);
}
