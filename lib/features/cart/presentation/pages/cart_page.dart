import 'package:divisoria/features/cart/presentation/widgets/cart_bottom_info.dart';
import 'package:divisoria/features/cart/presentation/widgets/cart_list.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CartList(),
          ),
          CartBottomInfo(),
        ],
      ),
    );
  }
}
