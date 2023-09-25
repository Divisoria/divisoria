import 'package:dartz/dartz.dart';
import 'package:divisoria/core/errors/exceptions.dart';
import 'package:divisoria/core/errors/failures.dart';
import 'package:divisoria/features/product/data/datasources/product_local_data_source.dart';
import 'package:divisoria/features/product/data/datasources/product_remote_data_source.dart';
import 'package:divisoria/features/product/domain/entities/product.dart';
import 'package:divisoria/features/product/domain/repositories/product_repository.dart';
import 'package:divisoria/features/product/domain/usecases/fetch_remote_product.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource productLocalDataSource;
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({
    required this.productLocalDataSource,
    required this.productRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Product>>> fetchCachedProducts() async {
    try {
      final products = await productLocalDataSource.fetchCachedProducts();

      return Right(products);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> fetchRemoteProducts() async {
    try {
      final products = await productRemoteDataSource.fetchRemoteProducts();

      return Right(products);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> fetchRemoteProduct(
      FetchRemoteProductParams params) async {
    try {
      final product = await productRemoteDataSource.fetchRemoteProduct(params);

      return Right(product);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
