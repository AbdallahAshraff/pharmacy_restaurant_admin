/////////////////////
// lib/features/auth/data/providers/orders_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pharmacy_restaurant_admin/features/auth/data/repository/home_repository.dart';
import 'package:pharmacy_restaurant_admin/features/auth/domain/entities/items_entity.dart';
import 'package:pharmacy_restaurant_admin/features/auth/domain/entities/order_entity.dart';
import 'package:pharmacy_restaurant_admin/features/auth/domain/use%20cases/best_seller_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:pharmacy_restaurant_admin/features/auth/data/data_source/home_remote_data_source.dart';

final supabase = Supabase.instance.client;
final dataSource = HomeRemoteDataSource(supabase: supabase);
 final usecase = Getbestsellerusecase(HomeRepository(homeRemoteDataSource: dataSource));

final ordersProvider = FutureProvider<List<DatabaseOrdersEntity>>((ref) async {
  final orders = await dataSource.fetchOrders();

  // Debug log
  for (var order in orders) {
    print("Order status: ${order.status}");
  }

  return orders;
});

final itemsProvider = FutureProvider<List<DatabaseItemEntity>>((ref) async {
  final items = await dataSource.fetchItems();
  return items;
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository(homeRemoteDataSource: dataSource);
});

final bestSellersProvider = FutureProvider<List<DatabaseItemEntity>>((ref) async {

  return await usecase.getBestSellers( pageKey: 0, pageSize: 10);
});


