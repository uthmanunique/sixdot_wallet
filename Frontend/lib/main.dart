import 'package:flutter/material.dart';
import 'package:sixdot/screens/splash_screen.dart';
import 'package:sixdot/screens/onboarding_screen.dart';
import 'package:sixdot/screens/signin_screen.dart';
import 'package:sixdot/screens/home_screen.dart';
import 'package:sixdot/screens/profile_screen.dart'; // Import the ProfileScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SixDot Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFF130042),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Define the initial route
      routes: {
        '/': (context) => SplashScreen(), // Splash screen as the initial route
        '/onboarding': (context) => OnboardingScreen(), // Onboarding screen
        '/signin': (context) => SignInScreen(), // Sign-in screen
        '/home': (context) => HomeScreen(), // Home screen
        '/profile': (context) => ProfileScreen(), // Profile screen
      },
    );
  }
}
