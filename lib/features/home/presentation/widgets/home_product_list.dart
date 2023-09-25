import 'package:divisoria/core/router/routes.dart';
import 'package:divisoria/features/common/presentation/widgets/base_64_image.dart';
import 'package:divisoria/features/product/presentation/blocs/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class HomeProductList extends StatefulWidget {
  const HomeProductList({super.key});

  @override
  State<HomeProductList> createState() => _HomeProductListState();
}

class _HomeProductListState extends State<HomeProductList> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ProductBloc>(context).add(ProductListFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (_, productState) {
        if (productState is ProductInProgress) {
          return Container();
        } else if (productState is ProductSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: MasonryGridView.builder(
              itemCount: productState.products.length,
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  left: index % 2 == 0 ? 0 : 8.0,
                  bottom: index < 4 ? 8.0 : 0,
                ),
                child: GestureDetector(
                  onTap: () {
                    context.push(
                      '${MainPages.product.path}/${productState.products[index].id}',
                    );
                  },
                  child: Container(
                    color: Colors.blue,
                    height: 300,
                    child: Base64Image(
                      base64: productState.products[index].image,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
