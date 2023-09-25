import 'package:divisoria/features/product/domain/entities/product.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'dart:io';

Future<void> configureHive() async {
  Directory directory = await path_provider.getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(ProductAdapter());
}
