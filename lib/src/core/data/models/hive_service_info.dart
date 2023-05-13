import 'package:hive/hive.dart';
import 'package:invoice_app/src/core/domain/data_models/service_info.dart';

part 'hive_service_info.g.dart';

@HiveType(typeId: 3)
class HiveServiceInfo extends HiveObject {
  @HiveField(0)
  String description;

  @HiveField(1)
  double quantity;

  @HiveField(2)
  String currency;

  @HiveField(3)
  double price;

  HiveServiceInfo(this.description, this.quantity, this.currency, this.price);

  //TODO: create mappers
  ServiceInfo toServiceInfo() =>
      ServiceInfo(description, quantity, currency, price);

  static HiveServiceInfo fromServiceInfo(ServiceInfo serviceInfo) =>
      HiveServiceInfo(
        serviceInfo.description,
        serviceInfo.quantity,
        serviceInfo.currency,
        serviceInfo.price,
      );
}
