import 'package:flutter/material.dart';
import 'package:tasks/features/auth/presentation/views/auth_view.dart';
import 'package:tasks/features/auth/presentation/views/login_view.dart';

import 'package:tasks/features/home/presentation/views/home_view.dart';

class RoutesName {
  static const String authView = '/';
  static const String loginView = 'loginView';
  static const String homeView = 'HomeView';
}

class AppRoutes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.authView:
        return MaterialPageRoute(
          builder: (context) => const AuthView(),
        );

      case RoutesName.loginView:
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );

      case RoutesName.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }

  static Widget unDefineRoute() {
    return const Scaffold(
      body: Center(
        child: Text('Route not found!'),
      ),
    );
  }
}
