import 'package:flutter/material.dart';
import 'package:labkesda_mobile/presentation/router/router.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Labkesda Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.redAccent,
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
