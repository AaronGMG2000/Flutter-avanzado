import 'package:band_names_app/pages/index.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const initialRoute = HomePage.routeName;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
