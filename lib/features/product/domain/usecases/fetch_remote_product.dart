import 'package:dartz/dartz.dart';
import 'package:divisoria/core/errors/failures.dart';
import 'package:divisoria/core/usecases/usecase.dart';
import 'package:divisoria/features/product/domain/entities/product.dart';
import 'package:divisoria/features/product/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchRemoteProduct implements UseCase<Product, FetchRemoteProductParams> {
  final ProductRepository repository;

  FetchRemoteProduct(this.repository);

  @override
  Future<Either<Failure, Product>> call(FetchRemoteProductParams params) async {
    return await repository.fetchRemoteProduct(params);
  }
}

class FetchRemoteProductParams extends Equatable {
  final String? id;

  const FetchRemoteProductParams({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
