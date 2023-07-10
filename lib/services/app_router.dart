import 'package:todolist/screens/Sign_Up/Sign_up_Screen.dart';
import 'package:todolist/screens/Sign_in/Sign_in_Screen.dart';
import '../screens/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import '../screens/recycle_bin.dart';
import '../screens/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.RouteName:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case TabsScreen.RouteName:
        return MaterialPageRoute(
          builder: (_) => const TabsScreen(),
        );
      case ForgotPasswordScreen.RouteName:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case SignUpScreen.RouteName:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case SignInScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );

      default:
        return null;
    }
  }
}
