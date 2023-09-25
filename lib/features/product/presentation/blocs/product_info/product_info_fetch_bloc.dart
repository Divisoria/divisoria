import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:divisoria/core/errors/failures.dart';
import 'package:divisoria/features/product/domain/entities/product.dart';
import 'package:divisoria/features/product/domain/usecases/fetch_remote_product.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'product_info_fetch_event.dart';
part 'product_info_fetch_state.dart';

@injectable
class ProductInfoFetchBloc
    extends Bloc<ProductInfoFetchEvent, ProductInfoFetchState> {
  final FetchRemoteProduct fetchRemoteProduct;

  ProductInfoFetchBloc({required this.fetchRemoteProduct})
      : super(ProductInfoFetchInitial()) {
    on<ProductInfoFetchEvent>((event, emit) async {
      if (event is ProductInfoFetched) {
        emit(ProductInfoFetchInProgress());

        final failOrRemoteProduct = await fetchRemoteProduct(event.param);

        await _eitherLoadedRemoteOrErroState(emit, failOrRemoteProduct);
      }
    });
  }

  Future<void> _eitherLoadedRemoteOrErroState(
    Emitter<ProductInfoFetchState> emit,
    Either<Failure, Product> failOrCachedProducts,
  ) async {
    await failOrCachedProducts.fold((failure) async {}, (product) async {
      emit(
        ProductInfoFetchSuccess(
          product: product,
        ),
      );
    });
  }
}
