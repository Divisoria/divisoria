part of 'product_info_fetch_bloc.dart';

@immutable
sealed class ProductInfoFetchState extends Equatable {
  const ProductInfoFetchState();
}

final class ProductInfoFetchInitial extends ProductInfoFetchState {
  @override
  List<Object?> get props => [];
}

final class ProductInfoFetchInProgress extends ProductInfoFetchState {
  @override
  List<Object?> get props => [];
}

final class ProductInfoFetchSuccess extends ProductInfoFetchState {
  final Product product;

  const ProductInfoFetchSuccess({required this.product});

  @override
  List<Object?> get props => [product];
}

final class ProductInfoFetchFailure extends ProductInfoFetchState {
  final String message;

  const ProductInfoFetchFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
