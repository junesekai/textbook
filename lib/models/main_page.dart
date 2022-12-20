import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/login_page.dart';
//import '../screens/list_ue_screen.dart';
import '../screens/progression_ue.dart';
//import '../screens/remplissage_ue_screen.dart';
//import 'cahier.dart';
import '../screens/acceuil_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AcceuilScreen();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
