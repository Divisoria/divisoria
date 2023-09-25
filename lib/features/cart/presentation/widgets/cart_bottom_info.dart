import 'package:divisoria/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartBottomInfo extends StatelessWidget {
  const CartBottomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16.0,
      child: Container(
        padding: const EdgeInsets.all(
          8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total'),
                Text('₱ 0.00'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                context.push(MainPages.signIn.path);
              },
              child: const Text(
                'Checkout',
              ),
            )
          ],
        ),
      ),
    );
  }
}
