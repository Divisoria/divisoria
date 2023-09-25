part of 'product_info_fetch_bloc.dart';

@immutable
sealed class ProductInfoFetchEvent extends Equatable {}

final class ProductInfoFetched extends ProductInfoFetchEvent {
  final FetchRemoteProductParams param;

  ProductInfoFetched(this.param);

  @override
  List<Object?> get props => [param];
}
