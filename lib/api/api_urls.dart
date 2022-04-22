import 'package:flutter/foundation.dart';

class ApiUrls {
  static const String _baseUrl = (kReleaseMode ?  'https://localhost.production/' : 'https://localhost.developement/') + 'api/';

  static String getBaseUrl() => _baseUrl;

}