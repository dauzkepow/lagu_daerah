import 'package:flutter/material.dart';
import 'package:lagu_daerah/pages/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

//command
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
