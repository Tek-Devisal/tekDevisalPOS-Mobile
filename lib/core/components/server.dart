// coverage:ignore-file
import '../utils/constants.dart';

class Server {
  factory Server({required Environment environment}) {
    switch (environment) {
      case Environment.DEV:
      case Environment.STG:
      case Environment.TEST:
        _instance.authority = 'http://10.0.2.2:3001/';
        break;
      case Environment.PROD:
        _instance.authority = 'production.production.com/';
        break;
    }
    return _instance;
  }

  Server._internal();

  static final Server _instance = Server._internal();

  static Server get instance => _instance;
  late final String authority;
}
