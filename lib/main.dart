import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VirtualBuild',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0x40404040),
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.grey,
        fontFamily: 'Gilroy',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineSmall: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: const HomeScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),
      },
    );
  }
}
