import 'package:flutter/material.dart';
import 'package:movies_app/core/di/service_locator.dart';
import 'package:movies_app/features/splash/splash_view.dart';

void main() {
  ServiceLocator.setup();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffFF8C00)),
      ),
      home: SplashView(),
    );
  }
}
