import 'package:buy_sell/screens/authentication/phoneauth_screen.dart';
import 'package:buy_sell/screens/login_screen.dart';
import 'package:buy_sell/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.cyan.shade900, fontFamily: 'lato'),
            home: SplashScreen(),
          );
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.cyan.shade900, fontFamily: 'lato'),
            home: LoginScreen(),
            routes: {
              LoginScreen.id: (context) => LoginScreen(),
              PhoneAuthScreen.id: (context) => PhoneAuthScreen(),
            },
          );
        }
      },
    );
  }
}
