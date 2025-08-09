class DatabaseItemModel {
  final String id;
  final DateTime? updatedAt;
  final String name;
  final int quantity;
  final int? categoryId;
  final String imageUrl;
  final int? price;
  final int wholesalePrice;
  final double? retailPrice;
  final String? description;
  final String? userId;
  final String? userId2;


  DatabaseItemModel({
    required this.id,
    this.updatedAt,
    this.categoryId,
    required this.name,
    required this.quantity,
   required this.imageUrl,
   required this.wholesalePrice,
    this.retailPrice,
    this.price,
    this.description,
    this.userId,
    this.userId2
  });

  factory DatabaseItemModel.fromJson(Map<String, dynamic> json) {
    return DatabaseItemModel(
      id: json['id'] as String,
      updatedAt: json['updated_at'] as DateTime,
      categoryId: json['category_id'] as int,
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? 0,
      imageUrl: json['image_url'],
      wholesalePrice: json['wholesale_price'] ?? 0.0,
      retailPrice: (json['retail_price'] != null)
          ? (json['retail_price'] as num).toDouble()
          : null,
      price: (json['price'] != null) ? json['price'] as int : null,
      description: json['description'],
      userId: json['user_id'],
      userId2: json['user_id2'],
    );
  }
}
