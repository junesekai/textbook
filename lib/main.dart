import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import './models/main_page.dart';
import 'screens/list_ue_screen.dart';
import 'screens/remplissage_ue_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          duration: 2000,
          splash: 'assets/images/book.png',
          nextScreen: MainPage(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
        ),
        /*routes: {
          ListUeScreen.routeName: (context) => ListUeScreen(),
          RemplissageUe.routeName:(context) => RemplissageUe(),
       },*/
        );
  }
}
