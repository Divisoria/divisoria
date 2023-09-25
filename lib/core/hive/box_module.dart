import 'package:divisoria/features/product/domain/entities/product.dart';
import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';

@module
abstract class BoxModule {
  @preResolve
  Future<Box<Product>> get recipeSchedule => Hive.openBox(kProductBoxKey);
}
