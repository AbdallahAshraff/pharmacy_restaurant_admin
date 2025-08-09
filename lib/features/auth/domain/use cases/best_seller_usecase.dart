import 'package:pharmacy_restaurant_admin/features/auth/data/repository/home_repository.dart';
import 'package:pharmacy_restaurant_admin/features/auth/domain/entities/items_entity.dart';

class Getbestsellerusecase {
  final HomeRepository homeRepository;
  Getbestsellerusecase(this.homeRepository);

  Future<List<DatabaseItemEntity>> getBestSellers({
    required int pageKey,
    required int pageSize,
  }) async {
    final bestseller = await homeRepository.fetchItems();
    bestseller.sort((a, b) => b.quantity.compareTo(a.quantity));

    final startIndex = pageKey;
    final endIndex = startIndex + pageSize;

    if (startIndex >= bestseller.length) return [];

    return bestseller.sublist(
      startIndex,
      endIndex > bestseller.length ? bestseller.length : endIndex,
    );

  }
}
