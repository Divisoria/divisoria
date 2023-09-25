import 'package:divisoria/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductBottomInfo extends StatelessWidget {
  const ProductBottomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16.0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            context.push(MainPages.cart.path);
          },
          child: const Text(
            'Add to cart',
          ),
        ),
      ),
    );
  }
}
