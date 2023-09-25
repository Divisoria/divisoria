import 'package:divisoria/core/config/config.dart';
import 'package:injectable/injectable.dart';

@Environment('prod')
@Injectable(as: Config)
class ProdConfig extends Config {
  @override
  String get baseUrl => "http://odoo.com/";

  @override
  String get api => "$baseUrl/api";

  @override
  String get fileRoot => "$baseUrl/file";
}
