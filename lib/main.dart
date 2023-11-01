import 'package:flutter/material.dart';
import 'package:labkesda_mobile/presentation/pages/home/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Labkesda Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.redAccent,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
