import 'dart:convert';

import 'package:divisoria/core/config/config.dart';
import 'package:divisoria/core/errors/exceptions.dart';
import 'package:divisoria/features/product/data/models/product_model.dart';
import 'package:divisoria/features/product/domain/usecases/fetch_remote_product.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class ProductRemoteDataSource {
  /// fetch [ProductModel] in remote
  ///
  /// Throws [ServerException] if no remote data is present.
  ///
  Future<List<ProductModel>> fetchRemoteProducts();
  Future<ProductModel> fetchRemoteProduct(FetchRemoteProductParams params);
}

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;
  final Config config;

  ProductRemoteDataSourceImpl({required this.client, required this.config});

  @override
  Future<List<ProductModel>> fetchRemoteProducts() async {
    final response = await client.get(
      Uri.parse('${config.api}/product'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<ProductModel> products = [];

      for (var value in data) {
        products.add(ProductModel.fromJson(value));
      }

      return products;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> fetchRemoteProduct(
    FetchRemoteProductParams params,
  ) async {
    try {
      final response = await client.get(
        Uri.parse('${config.api}/product/${params.id}'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        ProductModel product = ProductModel.fromJson(data);

        return product;
      } else {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }
}
