import 'package:hive/hive.dart';

part 'product.g.dart';

const kProductBoxKey = 'Product Box Key';

@HiveType(typeId: 0)
class Product extends HiveObject {
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  @HiveField(1)
  final int id;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final double price;

  @HiveField(5)
  final String image;
}
