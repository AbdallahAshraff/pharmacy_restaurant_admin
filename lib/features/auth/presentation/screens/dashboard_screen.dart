import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pharmacy_restaurant_admin/features/auth/domain/entities/items_entity.dart';
import 'package:pharmacy_restaurant_admin/features/auth/presentation/riverpods/home_river_pod/home_riverpod.dart';
import 'package:pharmacy_restaurant_admin/features/auth/presentation/widgets/home/dashboard_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  late PagingController<int, DatabaseItemEntity> pagingController =
      PagingController(
        fetchPage: (pageKey) =>
            usecase.getBestSellers(pageKey: pageKey, pageSize: 3),
        getNextPageKey: (state) =>
            state.lastPageIsEmpty ? null : state.nextIntPageKey,
      );

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  String normalize(String? status) => status?.trim().toLowerCase() ?? '';

  @override
  Widget build(BuildContext context) {
    final ordersAsync = ref.watch(ordersProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.apps),
            onPressed: () async {
              final response = await Supabase.instance.client
                  .from('orders')
                  .select();
              print('Raw response: $response');
            },
          ),
        ],
      ),
      body: ordersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (orders) {
          final activeOrders = orders.where((order) {
            final s = normalize(order.status);
            return s == 'pending' || s == 'processing' || s == 'shipped';
          }).length;

          final completedOrders = orders.where((order) {
            final s = normalize(order.status);
            return s == 'delivered';
          }).length;

          final returnOrders = orders.where((order) {
            final s = normalize(order.status);
            return s == 'cancelled';
          }).length;
          final totalOrders = orders.length;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date range text
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Oct 1, 2024 - Sep 1, 2024',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // ✅ Total Orders Card
                buildTotalOrdersCard(totalOrders),

                const SizedBox(height: 16),

                // ✅ Row with 3 small cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: buildOrdersCards(
                        title: 'Active Orders',
                        value: activeOrders,
                        percentage: '44.7%',
                        isPositive: true,
                        icon: Icons.shopping_bag_outlined,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: buildOrdersCards(
                        title: 'Completed',
                        value: completedOrders,
                        percentage: '28.1%',
                        isPositive: true,
                        icon: Icons.check,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: buildOrdersCards(
                        title: 'Return Orders',
                        value: returnOrders,
                        percentage: '8.9%',
                        isPositive: false,
                        icon: Icons.refresh,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                // Best Sellers
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Best Sellers',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.more_vert, color: Colors.grey, size: 20),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Divider(),
                        const SizedBox(height: 10),

                        // ✅ Paginated list
                        Expanded(
                          child: PagingListener(
                            controller: pagingController,
                            builder: (context, state, fetchNextPage) =>
                                PagedListView(
                                  state: state,
                                  fetchNextPage: fetchNextPage,
                                  builderDelegate:
                                      PagedChildBuilderDelegate<
                                        DatabaseItemEntity
                                      >(
                                        itemBuilder: (context, item, index) =>
                                            BestSellerItem(
                                              name: item.name,
                                              price: item.price ?? 0,
                                              quantitySold: item.quantity,
                                              imageUrl: item.imageUrl,
                                            ),
                                           
                                      ),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    super.key,
    required this.name,
    required this.price,
    required this.quantitySold,
    required this.imageUrl,
  });

  final String name;
  final int price;
  final int quantitySold;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(imageUrl, height: 60, width: 60),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Text(
              '$quantitySold sales',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
