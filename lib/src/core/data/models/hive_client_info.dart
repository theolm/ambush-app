import 'package:hive/hive.dart';

part 'hive_client_info.g.dart';

@HiveType(typeId: 4)
class HiveClientInfo extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String address;

  HiveClientInfo(this.name, this.address);
}
