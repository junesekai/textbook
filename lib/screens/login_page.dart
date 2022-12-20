import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controller text
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future SignIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim(),);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/book.png',
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    'Cahier de Text',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 34.0,
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "User Email",
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 26.0,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              GestureDetector(
                onTap: SignIn,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
