import 'package:divisoria/features/product/domain/entities/product.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class ProductLocalDataSource {
  Future<List<Product>> fetchCachedProducts();
}

@LazySingleton(as: ProductLocalDataSource)
class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final Box<Product> productBox;

  ProductLocalDataSourceImpl({required this.productBox});

  @override
  Future<List<Product>> fetchCachedProducts() {
    throw UnimplementedError();
  }
}
