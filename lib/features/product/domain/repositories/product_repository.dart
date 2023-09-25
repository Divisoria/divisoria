import 'package:dartz/dartz.dart';
import 'package:divisoria/core/errors/failures.dart';
import 'package:divisoria/features/product/domain/entities/product.dart';
import 'package:divisoria/features/product/domain/usecases/fetch_remote_product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> fetchRemoteProducts();
  Future<Either<Failure, List<Product>>> fetchCachedProducts();
  Future<Either<Failure, Product>> fetchRemoteProduct(
      FetchRemoteProductParams params);
}
