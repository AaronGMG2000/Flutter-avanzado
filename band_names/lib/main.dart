import 'package:band_names/pages/index.dart';
import 'package:band_names/providers/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SocketService())],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: StatusPage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        StatusPage.routeName: (_) => const StatusPage(),
      },
    );
  }
}
