<<<<<<< HEAD

=======
import 'package:firebase_core/firebase_core.dart';
>>>>>>> 647e509c1fb9db739a59c7571d92960031b968e5
import 'package:flutter/material.dart';
import 'package:virtualbuild/screens/auth/home_screen.dart';
import 'package:virtualbuild/screens/auth/login_screen.dart';
import 'package:virtualbuild/screens/auth/otp_screen.dart';
import 'package:virtualbuild/screens/auth/register_screen.dart';
import 'package:virtualbuild/screens/auth/resetpassword_screen.dart';
import 'package:virtualbuild/screens/auth/user_info_screen.dart';
import 'package:virtualbuild/screens/chats/chats_screen.dart';
import 'package:virtualbuild/screens/widgettree.dart';
import 'screens/accounts/account_screen.dart';
import 'screens/display_screen.dart';
import 'screens/architects/explorearchitects_screen.dart';
import 'screens/housemodels/exploremodels_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/auth/forgotpassword_screen.dart';
import 'screens/accounts/edit_profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        canvasColor: const Color.fromARGB(64, 161, 157, 157),
        secondaryHeaderColor: Colors.white,
        fontFamily: 'Gilroy',
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headlineMedium: TextStyle(
              fontWeight: FontWeight.w900,
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
            titleSmall: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.white,
            )),
      ),
      // initialRoute: HomeScreen.routeName,
      home: const WidgetTree(),
      //All routes for navigations.
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        RegisterScreen.routeName: (ctx) => const RegisterScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        ForgotPasswordScreen.routeName: (ctx) => const ForgotPasswordScreen(),
        OTPScreen.routeName: (ctx) => const OTPScreen(),
        ResetPasswordScreen.routeName: (ctx) => const ResetPasswordScreen(),
        DisplayScreen.routeName: (ctx) => DisplayScreen(),
        AccountScreen.routeName: (ctx) => const AccountScreen(),
        ChatsScreen.routeName: (ctx) => const ChatsScreen(),
        ExploreArchitectsScreen.routeName: (ctx) => ExploreArchitectsScreen(),
        ExploreModelsScreen.routeName: (ctx) => ExploreModelsScreen(),
        FavoritesScreen.routeName: (ctx) => FavoritesScreen(),
        EditProfileScreen.routeName: (ctx) => const EditProfileScreen(),
        UserInfoScreen.routeName: (ctz) => const UserInfoScreen()
      },
    );
  }
}
