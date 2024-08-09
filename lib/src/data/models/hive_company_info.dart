import 'package:hive/hive.dart';
import 'package:ambush_app/src/domain/models/comp_info.dart';

part 'hive_company_info.g.dart';

@HiveType(typeId: 1)
class HiveCompanyInfo extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String address;

  @HiveField(2, defaultValue: '')
  String email;

  @HiveField(3, defaultValue: '')
  String ownerName;

  @HiveField(4, defaultValue: null)
  String? cnpj;

  HiveCompanyInfo(
    this.name,
    this.address,
    this.email,
    this.ownerName,
    this.cnpj,
  );

  factory HiveCompanyInfo.fromDataModel(CompanyInfo data) =>
      HiveCompanyInfo(
          data.name,
          data.address,
          data.email,
          data.ownerName,
          data.cnpj,
      );

  CompanyInfo toDataModel() => CompanyInfo(name, address, email, ownerName, cnpj);
}
