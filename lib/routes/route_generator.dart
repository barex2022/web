import 'package:barex_website/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/landing_page.dart';


class RouteGenerator {
  static MaterialPageRoute? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case routeAbout:
        return MaterialPageRoute(builder: (_) => AboutPage());
        break;
      case routeContacts:
        return MaterialPageRoute(builder: (_) => ContactUs());
        break;
    }
    return null;
  }
}