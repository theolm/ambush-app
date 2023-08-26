import 'package:hive/hive.dart';
import 'package:invoice_app/src/domain/models/comp_info.dart';

part 'hive_company_info.g.dart';

@HiveType(typeId: 1)
class HiveCompanyInfo extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String address;

  HiveCompanyInfo(this.name, this.address);

  factory HiveCompanyInfo.fromDataModel(CompanyInfo data) =>
      HiveCompanyInfo(data.name, data.address);

  CompanyInfo toDataModel() =>
      CompanyInfo(name, address);
}
