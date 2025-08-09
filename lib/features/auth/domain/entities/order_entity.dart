import 'package:pharmacy_restaurant_admin/features/auth/data/models/orders_model.dart';

class DatabaseOrdersEntity extends DatabaseOrdersModel {
  DatabaseOrdersEntity({
    required super.id,
    required super.status,
  });

  DatabaseOrdersEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
  }
}
