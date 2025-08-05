import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

late final ValueNotifier<String> token;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  token = ValueNotifier(localStorage.getItem('token') ?? 'no token');

  token.addListener(() {
    localStorage.setItem('token', token.value.toString());
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ValueListenableBuilder<String>(
            valueListenable: token,
            builder: (context, value, child) {
              return Text('Pressed $value times');
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            token;
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
