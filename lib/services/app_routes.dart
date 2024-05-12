import 'package:flutter/material.dart';
import 'package:ssen_admin/intermediate.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Intermediate.route:
        return MaterialPageRoute(builder: (_) => const Intermediate());
      default:
        return null;
    }
  }
}
