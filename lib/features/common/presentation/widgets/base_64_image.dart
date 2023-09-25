import 'dart:convert';
import 'package:flutter/widgets.dart';

class Base64Image extends StatelessWidget {
  final String base64;

  const Base64Image({super.key, required this.base64});

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      base64Decode(base64),
      fit: BoxFit.cover,
    );
  }
}
