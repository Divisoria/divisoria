import 'package:divisoria/core/router/routes.dart';
import 'package:divisoria/features/home/presentation/widgets/home_product_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Divisoria'),
        actions: [
          IconButton(
            onPressed: () {
              context.push(MainPages.cart.path);
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: const HomeProductList(),
    );
  }
}
