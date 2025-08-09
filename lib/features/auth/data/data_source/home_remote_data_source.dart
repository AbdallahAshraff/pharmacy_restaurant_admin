///
import 'package:pharmacy_restaurant_admin/features/auth/data/models/items_model.dart';
import 'package:pharmacy_restaurant_admin/features/auth/domain/entities/items_entity.dart';
import 'package:pharmacy_restaurant_admin/features/auth/domain/entities/order_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class HomeRemoteDataSource {
  final SupabaseClient supabase;

  HomeRemoteDataSource({required this.supabase});

  Future<List<DatabaseOrdersEntity>> fetchOrders() async {
    final response = await supabase.from('orders').select();
    final data = response as List;
    return data.map((order) => DatabaseOrdersEntity.fromJson(order)).toList();
  }

  Future<List<DatabaseItemEntity>> fetchItems() async {
    final response = await supabase
        .from('items')
        .select();

    final data = response as List;
    return data.map((e) => DatabaseItemEntity.fromJson(e)).toList();
  }
}
