import 'package:dartz/dartz.dart';
import 'package:divisoria/core/errors/failures.dart';
import 'package:divisoria/core/usecases/usecase.dart';
import 'package:divisoria/features/product/domain/entities/product.dart';
import 'package:divisoria/features/product/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchRemoteProducts implements UseCase<List<Product>, NoParams> {
  final ProductRepository repository;

  FetchRemoteProducts(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await repository.fetchRemoteProducts();
  }
}
