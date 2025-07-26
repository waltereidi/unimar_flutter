//Importar os componentes necessários do Flutter
// Import the Flutter Material package
// This package provides the Material Design widgets and themes.
import 'package:flutter/material.dart';
import 'package:unimar_sab_19/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF87AB)),
      ),
      initialRoute: '/login',
      routes: routes,
    );
  }
}
