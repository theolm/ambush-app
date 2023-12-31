import 'package:json_annotation/json_annotation.dart';

import 'invoice.dart';

part 'backup.g.dart';

@JsonSerializable()
class Backup {
  final String id;
  final int createdAt;
  final List<Invoice> invoices;

  Backup(this.id, this.createdAt, this.invoices);

  factory Backup.fromJson(Map<String, dynamic> json) => _$BackupFromJson(json);

  Map<String, dynamic> toJson() => _$BackupToJson(this);
}
