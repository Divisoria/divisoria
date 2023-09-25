import 'package:divisoria/core/dependency_injection/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

// Environmens
const dev = Environment('dev');
const prod = Environment('prod');

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies({
  required Environment environment,
}) async =>
    $initGetIt(getIt, environment: environment.name);
