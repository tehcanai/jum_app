import 'package:flutter/widgets.dart';
import 'package:jum_app/main.dart';
import 'package:jum_app/pages/auth/register.dart';
import 'package:jum_app/pages/auth/verify_user.dart';
import 'package:jum_app/pages/home.dart';

import '../pages/auth/login.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/home': (context) => const HomePage(),
    '/login': (context) => const LoginPage(),
    '/register': (context) => const RegisterPage(),
    '/verify-user': (context) => const VerifyUserPage(),
  };
}
