import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      prefs.then((SharedPreferences prefs) {
        final seen = prefs.getBool('seen');
        if (seen == null) {
          context.go('/on-board');
        } else {
          context.go('/');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.5, 0.6, 0.9],
            colors: [
              AppColors.primary,
              AppColors.primary,
              AppColors.secondary,
              AppColors.secondary,
            ],
          ),
        ),
        child: const Center(
          child: Image(
            image: AssetImage('assets/images/applogo.png'),
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
