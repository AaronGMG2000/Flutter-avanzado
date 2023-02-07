import 'package:flutter/material.dart';

import 'package:band_names_app/routes/app_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}