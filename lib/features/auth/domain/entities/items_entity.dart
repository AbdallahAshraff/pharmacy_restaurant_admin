import 'package:pharmacy_restaurant_admin/features/auth/data/models/items_model.dart';

class DatabaseItemEntity extends DatabaseItemModel {
  DatabaseItemEntity({
    required super.id,
    required super.name,
    required super.quantity,
    required super.wholesalePrice,
    required super.imageUrl
  });
    
  factory DatabaseItemEntity.fromJson(Map<String, dynamic> json) {
    return DatabaseItemEntity(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? 0,
      wholesalePrice: json['wholesale_price'] ?? 0,
      imageUrl: json['image_url'] ?? '',
      
    );
  }

}
