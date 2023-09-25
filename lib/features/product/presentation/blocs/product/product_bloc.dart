import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:divisoria/core/errors/failures.dart';
import 'package:divisoria/core/usecases/usecase.dart';
import 'package:divisoria/features/product/domain/entities/product.dart';
import 'package:divisoria/features/product/domain/usecases/fetch_remote_products.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchRemoteProducts fetchRemoteProducts;

  ProductBloc({
    required this.fetchRemoteProducts,
  }) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is ProductListFetched) {
        if (state is ProductInitial) {
          emit(ProductInProgress());
        }

        final failOrRemoteProducts = await fetchRemoteProducts(NoParams());

        await _eitherLoadedRemoteOrErroState(emit, failOrRemoteProducts);
      }
    });
  }

  Future<void> _eitherLoadedRemoteOrErroState(
    Emitter<ProductState> emit,
    Either<Failure, List<Product>> failOrCachedProducts,
  ) async {
    await failOrCachedProducts.fold((failure) async {}, (listOfProducts) async {
      if (listOfProducts.isNotEmpty) {
        emit(
          ProductSuccess(
            products: listOfProducts,
          ),
        );
      }
    });
  }
}
