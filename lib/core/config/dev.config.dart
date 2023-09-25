import 'package:divisoria/core/config/config.dart';
import 'package:injectable/injectable.dart';

@Environment('dev')
@Injectable(as: Config)
class DevConfig extends Config {
  @override
  String get baseUrl => "https://d53d-136-158-56-186.ngrok-free.app";

  @override
  String get api => "$baseUrl/api";

  @override
  String get fileRoot => "$baseUrl/file";
}
