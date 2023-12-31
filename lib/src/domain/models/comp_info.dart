import 'package:json_annotation/json_annotation.dart';

part 'comp_info.g.dart';

@JsonSerializable()
class CompanyInfo {
  final String name;
  final String address;

  CompanyInfo(this.name, this.address);

  factory CompanyInfo.fromJson(Map<String, dynamic> json) =>
      _$CompanyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyInfoToJson(this);
}
