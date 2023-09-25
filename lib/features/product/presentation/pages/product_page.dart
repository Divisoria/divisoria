import 'package:divisoria/features/common/presentation/widgets/base_64_image.dart';
import 'package:divisoria/features/product/domain/usecases/fetch_remote_product.dart';
import 'package:divisoria/features/product/presentation/blocs/product_info/product_info_fetch_bloc.dart';
import 'package:divisoria/features/product/presentation/widgets/product_bottom_info.dart';
import 'package:divisoria/features/product/presentation/widgets/product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ProductInfoFetchBloc>(context).add(
      ProductInfoFetched(
        FetchRemoteProductParams(
          id: widget.id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: BlocBuilder<ProductInfoFetchBloc, ProductInfoFetchState>(
        builder: (context, productInfoFetchState) {
          if (productInfoFetchState is ProductInfoFetchInProgress) {
            return Container();
          } else if (productInfoFetchState is ProductInfoFetchSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.blue,
                          child: Base64Image(
                            base64: productInfoFetchState.product.image,
                          ),
                        ),
                        ProductInfo(
                          product: productInfoFetchState.product,
                        ),
                      ],
                    ),
                  ),
                ),
                const ProductBottomInfo(),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
