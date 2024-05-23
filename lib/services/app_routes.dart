import 'package:flutter/material.dart';
import 'package:ssen_admin/intermediate.dart';
import 'package:ssen_admin/screens/about_us.dart';
import 'package:ssen_admin/screens/component/company.dart';
import 'package:ssen_admin/screens/setting.dart';
import 'package:ssen_admin/screens/term_condition.dart';

import '../screens/component/home.dart';
import '../screens/component/user.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Intermediate.route:
        return MaterialPageRoute(builder: (_) => const Intermediate());
      case TermsAndConditionsPage.route:
        return MaterialPageRoute(builder: (_) => TermsAndConditionsPage());
      case AboutUsPage.route:
        return MaterialPageRoute(builder: (_) => AboutUsPage());
      case SettingsPage.route:
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case Home.route:
        return MaterialPageRoute(builder: (_) => Home());
      case User.route:
        return MaterialPageRoute(builder: (_) => User());
      case Company.route:
        return MaterialPageRoute(builder: (_) => Company());
      default:
        return null;
    }
  }
}
