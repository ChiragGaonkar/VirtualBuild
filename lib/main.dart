import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualbuild/providers/architects_provider.dart';
import 'package:virtualbuild/providers/chatsprovider.dart';
import 'package:virtualbuild/providers/drawer_nav_provider.dart';
import 'package:virtualbuild/providers/models_provider.dart';
import 'package:virtualbuild/providers/user_data_provider.dart';
import 'package:virtualbuild/screens/architects/architect_detail_screen.dart';
import 'package:virtualbuild/screens/auth/home_screen.dart';
import 'package:virtualbuild/screens/auth/login_screen.dart';
import 'package:virtualbuild/screens/auth/otp_screen.dart';
import 'package:virtualbuild/screens/auth/register_screen.dart';
import 'package:virtualbuild/screens/auth/resetpassword_screen.dart';
import 'package:virtualbuild/screens/auth/user_info_screen.dart';
import 'package:virtualbuild/screens/botarchitect/bot_chats_screen.dart';
import 'package:virtualbuild/screens/chats/chat_detail.dart';
import 'package:virtualbuild/screens/chats/chats_screen.dart';
import 'package:virtualbuild/screens/housemodels/models_detail_screen.dart';
import 'package:virtualbuild/screens/widgettree.dart';
import 'screens/accounts/account_screen.dart';
import 'screens/display_screen.dart';
import 'screens/architects/explorearchitects_screen.dart';
import 'screens/housemodels/exploremodels_screen.dart';
import 'screens/favourites/favorites_screen.dart';
import 'screens/auth/forgotpassword_screen.dart';
import 'screens/accounts/edit_profile_screen.dart';
import 'firebase_options.dart';
import 'package:page_transition/page_transition.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserDataProvide()),
        ChangeNotifierProvider(create: (ctx) => DrawerNavProvider()),
        ChangeNotifierProvider(create: (ctx) => ChatsProvider()),
        ChangeNotifierProvider(create: (ctx) => ModelsProvider()),
        ChangeNotifierProvider(create: (ctx) => ArchitectsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VirtualBuild',
        theme: ThemeData(
          // scaffoldBackgroundColor: const Color(0x40404040),
          scaffoldBackgroundColor: Colors.black,
          primarySwatch: Colors.teal,
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
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            titleSmall: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            labelMedium: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
        home: AnimatedSplashScreen(
          backgroundColor: Colors.black,
          splash: "assets/Logo.png",
          splashIconSize: 400,
          duration: 4000,
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: const WidgetTree(),
          pageTransitionType: PageTransitionType.leftToRightWithFade,
        ),
        //All routes for navigations.
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          RegisterScreen.routeName: (ctx) => const RegisterScreen(),
          LoginScreen.routeName: (ctx) => const LoginScreen(),
          ForgotPasswordScreen.routeName: (ctx) => const ForgotPasswordScreen(),
          OTPScreen.routeName: (ctx) => const OTPScreen(),
          ResetPasswordScreen.routeName: (ctx) => const ResetPasswordScreen(),
          DisplayScreen.routeName: (ctx) => const DisplayScreen(),
          AccountScreen.routeName: (ctx) => const AccountScreen(),
          ChatsScreen.routeName: (ctx) => ChatsScreen(),
          ExploreArchitectsScreen.routeName: (ctx) => ExploreArchitectsScreen(),
          ExploreModelsScreen.routeName: (ctx) => ExploreModelsScreen(),
          FavoritesScreen.routeName: (ctx) => FavoritesScreen(),
          EditProfileScreen.routeName: (ctx) => const EditProfileScreen(),
          UserInfoScreen.routeName: (ctx) => const UserInfoScreen(),
          ChatDetail.routeName: (ctx) => const ChatDetail(),
          ModelsDetailScreen.routeName: (ctx) => const ModelsDetailScreen(),
          ArchitectDetailScreen.routeName: (ctx) =>
              const ArchitectDetailScreen(),
          ChatWithBotScreen.routeName: (ctx) => const ChatWithBotScreen(),
        },
      ),
    );
  }
}
