import 'package:pharmacy_restaurant_admin/features/auth/data/data_source/home_remote_data_source.dart';

import 'package:pharmacy_restaurant_admin/features/auth/domain/entities/items_entity.dart';
import 'package:pharmacy_restaurant_admin/features/auth/domain/entities/order_entity.dart';


//// change names of files

class HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepository({required this.homeRemoteDataSource});

  Future<List<DatabaseOrdersEntity>> fetchOrders() async {
    return homeRemoteDataSource.fetchOrders();
  }

  Future<List<DatabaseItemEntity>> fetchItems() async {
    return homeRemoteDataSource.fetchItems();
  }
}