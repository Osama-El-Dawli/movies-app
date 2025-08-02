import 'package:flutter/material.dart';
import 'package:movies_app/features/splash/splash_view.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white,),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
