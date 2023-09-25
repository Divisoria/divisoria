import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          bottom: index < 5 ? 8.0 : 0,
        ),
        child: Container(
          color: Colors.blue,
          height: 100.0,
        ),
      ),
    );
  }
}
