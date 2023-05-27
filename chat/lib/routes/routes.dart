import 'package:chat/pages/index.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  LoginPage.routeName: (_) => const LoginPage(),
  RegisterPage.routeName: (_) => const RegisterPage(),
  LoadingPage.routeName: (_) => const LoadingPage(),
  ChatPage.routeName: (_) => const ChatPage(),
  UsuariosPage.routeName: (_) => const UsuariosPage(),
};

String initialRoute = LoginPage.routeName;
