import 'package:flutter/material.dart';
import 'package:flutterdose/page/MainPage.dart';

import '../page/not_found_page.dart';

class Routers {
  static Route<dynamic> generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case RoutersPath.home:
        return MaterialPageRoute(builder: (context) => const MainPage());
      default:
        return MaterialPageRoute(builder:(context) =>const NotFoundPage());
    }
  }
}

class RoutersPath {
  static const String home = '/home';
  static const String discover = '/discover';
  static const String profile = '/profile';
  static const String notFound = '/notFound';
}
