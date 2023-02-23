import 'package:flutter/material.dart';
import 'package:virtualbuild/screens/account_screen.dart';
import 'package:virtualbuild/screens/chats_screen.dart';
import 'package:virtualbuild/screens/display_screen.dart';
import 'package:virtualbuild/screens/explorearchitects_screen.dart';
import 'package:virtualbuild/screens/exploremodels_screen.dart';
import 'package:virtualbuild/screens/favorites_screen.dart';
import 'package:virtualbuild/screens/forgotpassword_screen.dart';
import 'package:virtualbuild/screens/login_screen.dart';
import 'package:virtualbuild/screens/otp_screen.dart';
import 'package:virtualbuild/screens/register_screen.dart';
import 'package:virtualbuild/screens/resetpassword_screen.dart';
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
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
      // initialRoute: HomeScreen.routeName,
      home: ForgotPasswordScreen(),
      //All routes for navigations.
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        RegisterScreen.routeName: (ctx) => const RegisterScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        ForgotPasswordScreen.routeName: (ctx) => const ForgotPasswordScreen(),
        OTPScreen.routeName: (ctx) => const OTPScreen(),
        ResetPasswordScreen.routeName: (ctx) => const ResetPasswordScreen(),
        DisplayScreen.routeName: (ctx) => DisplayScreen(),
        AccountScreen.routeName: (ctx) => AccountScreen(),
        ChatsScreen.routeName: (ctx) => ChatsScreen(),
        ExploreArchitectsScreen.routeName: (ctx) => ExploreArchitectsScreen(),
        ExploreModelsScreen.routeName: (ctx) => ExploreModelsScreen(),
        FavoritesScreen.routeName: (ctx) => FavoritesScreen(),
      },
    );
  }
}
